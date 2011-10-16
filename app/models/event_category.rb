class EventCategory < ActiveRecord::Base
  include Extensions::UUID
  
  belongs_to :event
  belongs_to :category
end
