require 'will_paginate'
require 'will_paginate/active_record'

class Trip < ActiveRecord::Base
  belongs_to :starting_station, :class_name => "Station", :foreign_key => :start_station
  belongs_to :starting_date, :class_name => "BikeDate", :foreign_key => :start_date
  belongs_to :ending_station, :class_name => "Station", :foreign_key => :end_station
  belongs_to :ending_date, :class_name => "BikeDate", :foreign_key => :end_date
  belongs_to :bike, :class_name => "Bike", :foreign_key => :bike_id
  belongs_to :subscription, :class_name => "Subscription", :foreign_key => :subscription_type
  belongs_to :zip, :class_name => "ZipCode", :foreign_key => :zip_code

  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station, presence: true
  validates :end_date, presence: true
  validates :end_station, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true

#trip-dashboard

  def self.average_duration_of_a_ride
    average(:duration)
  end

  def self.longest_duration_of_a_ride
    maximum(:duration)
  end

  def self.shortest_duration_of_a_ride
    minimum(:duration)
  end


  def self.start_station_with_most_rides
    trip_by_station = Trip.group(:start_station).count
    most_trips = trip_by_station.max_by {|k,v| v}
    Station.find(most_trips[0]).name
  end

  def self.end_station_with_most_rides
    trip_by_station = Trip.group(:end_station).count
    most_trips = trip_by_station.max_by {|k,v| v}
    Station.find(most_trips[0]).name
  end

  def self.monthly_subtotal_of_trips_per_year #needs to be iterated over in view for month and year
    by_month = BikeDate.group("DATE_TRUNC('month', date)").count
    by_month.sort
  end

  def self.most_ridden_bike
    trips_by_bike = Trip.group(:bike_id).count
    most_trips = trips_by_bike.max_by { |bike_id, trips| trips }.first
  end

  def self.total_rides_for_most_ridden_bike
    trips_by_bike = Trip.group(:bike_id).count
    most_trips = trips_by_bike.max_by { |bike_id, trips| trips }.last
  end

  def self.least_ridden_bike
    Trip.group(:bike_id).count.min_by { |bike_id, trips| trips }.first
  end

  def self.total_rides_for_least_ridden_bike
    Trip.group(:bike_id).count.min_by { |bike_id, trips| trips }.last
  end

  def self.date_with_most_trips
    BikeDate.find(Trip.group(:start_date).order("count_id asc").count(:id).keys.last).date
  end

  def self.number_of_trips_on_day_with_most_trips
    Trip.group(:start_date).order("count_id asc").count(:id).values.last
  end

  def self.date_with_least_trips
    BikeDate.find(Trip.group(:start_date).order("count_id desc").count(:id).keys.last).date
  end

  def self.number_of_trips_on_day_with_least_trips
    Trip.group(:start_date).order("count_id desc").count(:id).values.last
  end

  #Ind station show page

  def self.trips_from_starting(station_id)
    Trip.where(start_station: station_id).count
  end

  def self.trips_from_ending(station_id)
    Trip.where(end_station: station_id).count
  end

  def self.most_frequent_destination_from(station_id)
    all_ends = Trip.where(start_station: station_id).map { |station| station.end_station}
    Station.find(all_ends.max_by{|set| all_ends.count(set)}).name
  end

  def self.most_frequent_origin_for_rides_ending_at(station_id)
    all_starts = Trip.where(end_station: station_id).map { |station| station.start_station}
    Station.find(all_starts.max_by{|set| all_starts.count(set)}).name
  end

  def self.date_for_highest_number_of_trips_from(station_id)
      dates = Trip.where(start_station: station_id).map { |trip| trip.start_date}
      BikeDate.find(dates.max_by{|set| dates.count(set)}).date
  end

  def self.frequently_used_zip_code_for_users_from(station_id)
    zips =Trip.where(start_station: station_id).map { |trip| trip.zip_code}
    ZipCode.find(zips.max_by{|set| zips.count(set)}).zip_code
  end

  def self.frequently_used_bike_id_from(station_id)
    bikes = Trip.where(start_station: station_id).map { |trip| trip.bike_id}
    Bike.find(bikes.max_by{|set| bikes.count(set)}).bike
  end

end
