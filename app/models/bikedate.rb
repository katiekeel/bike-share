class BikeDate < ActiveRecord::Base
  # has_many :started_trips, class_name: "Trip", foreign_key: :start_date

  belongs_to :trip
  belongs_to :condition

  validates :date, presence: true

  def self.bike_date_create(date)
    find_or_create_by!(date: DateTime.strptime(date, '%m/%d/%Y')).id
  end
end
