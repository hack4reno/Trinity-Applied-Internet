class EventRating < ActiveRecord::Base
  include Extensions::UUID

  belongs_to :event
end
