class Category < ActiveRecord::Base
  include Extensions::UUID
  
  has_many :event_categories
  has_many :events, :through => :event_categories
end
