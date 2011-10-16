class Event < ActiveRecord::Base
  include Extensions::UUID
  acts_as_gmappable :process_geocoding => false
  
  has_many :event_categories, :dependent => :destroy
  accepts_nested_attributes_for :event_categories

  has_many :categories, :through => :event_categories

  accepts_nested_attributes_for :categories
  
  belongs_to :original_event, :class_name => Event
  belongs_to :place
  belongs_to :repeat_frequency
  belongs_to :age_rating
  belongs_to :price
  
  has_many   :event_ratings

  def gmaps4rails_address
    "#{place.address_1} #{place.address_2}, #{place.city}, #{place.country}" 
  end
  
  def icon_name
    categories[0].name.downcase
  rescue
    "star"
  end
  
  def dates
    return [] if self.start_at.blank?
    
    d = [ Date.today, Date.today+1.day, Date.today.end_of_week, (Date.today+7.days).end_of_week, Date.today.end_of_month, (Date.today+30.days).end_of_month ].select {|d| self.start_at.to_date <= d }
    d.map {|date| date.strftime( '%Y-%m-%d' ) }
  end
  
  before_validation :set_defaults
  before_save :update_position
  
  
  
  protected
    def set_defaults
      self.repeat_frequency = RepeatFrequency.find_by_name('None') if self.repeat_frequency_id.blank?
      self.age_rating = AgeRating.find_by_name("Adults") if self.age_rating_id.blank?
      self.price = Price.find_by_name("Free") if self.price_id.blank?
      true
    end
  
    def update_position
      unless place.nil?
        self.latitude = place.latitude
        self.longitude = place.longitude
      end

      true
    end
  
end
