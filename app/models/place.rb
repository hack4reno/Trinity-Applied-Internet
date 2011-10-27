class Place < ActiveRecord::Base
  include Extensions::UUID  
  acts_as_gmappable 
  
  has_many :events
  belongs_to :owner, :class_name => User
  belongs_to :authentic_place, :class_name => Place

  def to_label
    self.name
  end

  def gmaps4rails_address
    "#{self.address_1} #{self.address_2}, #{self.city}, #{self.country}" 
  end
end
