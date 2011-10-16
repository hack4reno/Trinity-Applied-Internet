class AgeRating < ActiveRecord::Base
  include Extensions::UUID

  has_many :events
end
