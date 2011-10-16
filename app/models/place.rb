class Place < ActiveRecord::Base
  include Extensions::UUID
  acts_as_gmappable 
  
  has_many :events

  def gmaps4rails_address
    "#{self.address_1} #{self.address_2}, #{self.city}, #{self.country}" 
  end
end
