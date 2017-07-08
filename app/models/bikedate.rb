class BikeDate < ActiveRecord::Base
  has_many :started_trips, class_name: "Trip", foreign_key: :start_date

  validates :date, presence: true

  def self.bike_date_create(date)
    find_or_create_by!(date: DateTime.strptime(date, '%m/%d/%Y')).id
  end

  def self.form_date_create(date)
    find_or_create_by!(date: DateTime.strptime(date, '%Y-%m-%dT%H:%M')).id
  end
end
