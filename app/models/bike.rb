class Bike < ActiveRecord::Base
  validates :bike, presence: true
end
