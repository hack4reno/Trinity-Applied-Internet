class Event < ActiveRecord::Base
  include Extensions::UUID
  acts_as_gmappable :process_geocoding => false
  has_many :event_categories, :dependent => :destroy
  has_many :categories, :through => :event_categories
  
  belongs_to :original_event, :class_name => Event
  belongs_to :place
  belongs_to :repeat_frequency
  belongs_to :age_rating
  belongs_to :price
  
  has_many   :event_ratings

  def gmaps4rails_address
    "#{place.address_1} #{place.address_2}, #{place.city}, #{place.country}" 
  end
end
