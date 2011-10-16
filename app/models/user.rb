class User < ActiveRecord::Base
  include Extensions::UUID
  
  has_many :user_tokens, :dependent => :destroy
  has_many :authorizations, :dependent => :destroy
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable, :lockable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :title, :company, :deleted, :time_zone
  
  after_create :setup_defaults 
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def soft_delete
    update_attribtue(:deleted, true)
  end
  
  def self.find_for_authentication(conditions)
    super(conditions.merge(:deleted => false))
  end
    
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session[:omniauth]
        user.user_tokens.build(:provider => data['provider'], :uid => data['uid'])
      end
    end
  end
  
  def apply_omniauth(omniauth)
    #add some info about the user
    self.first_name = omniauth['user_info']['first_name'] if first_name.blank?
    self.last_name = omniauth['user_info']['last_name'] if last_name.blank?
    
    unless omniauth['credentials'].blank?
      user_tokens.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
      #user_tokens.build(:provider => omniauth['provider'], 
      #                  :uid => omniauth['uid'],
      #                  :token => omniauth['credentials']['token'], 
      #                  :secret => omniauth['credentials']['secret'])
    else
      user_tokens.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
    end
    #self.confirm!# unless user.email.blank?
  end
  
  def password_required?
    (user_tokens.empty? || !password.blank?) && super  
  end
  
  # bypasses Devise's requirement to re-enter current password to edit
  def update_with_password(params={}) 
    if params[:password].blank? 
      params.delete(:password) 
      params.delete(:password_confirmation) if params[:password_confirmation].blank? 
    end 
    update_attributes(params) 
  end
  
  protected 
    def setup_defaults
      # create a default account for this user
      account = Account.create!( :name => "#{first_name} #{last_name}'s Profile", :active => true, :creator => self )
      
      # make this user the owner of said account
      AccountUser.create!( :account => account, :user => self, :account_role => AccountRole.find_by_name('Owner') )
      
      update_attribute( :default_account_id, account.uuid )
    end
end
