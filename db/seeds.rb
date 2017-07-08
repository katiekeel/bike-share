require 'csv'
require './app/models/station.rb'
require './app/models/city.rb'
require './app/models/trip.rb'
require './app/models/bike.rb'
require './app/models/zip_code.rb'
require './app/models/subscription.rb'
require './app/models/bikedate.rb'
require './app/models/condition.rb'

# Condition.destroy_all
Station.delete_all
City.delete_all
# Bike.destroy_all
# Trip.destroy_all
# ZipCode.destroy_all
# Subscription.destroy_all
# BikeDate.destroy_all
#
def from_csv(file_path)
  values = []
  contents = CSV.open(file_path, headers: true, header_converters: :symbol)
  contents.each { |row| values << row.to_h}
  values
end

def seed_city_database(file_path)
  csv = from_csv(file_path)
  cities = csv.each do |row|
    row.keep_if {|key, value| key == :city}
  end
  cities.uniq.each {|city| City.create!(city)}
end
#
def seed_station_database(file_path)
  stations = from_csv(file_path)
  stations.each do |station|
    city = City.find_by(city: station[:city])
    station.delete_if {|key, value| key == :lat || key == :long || key == :city}
    station[:station_id] = station.delete(:id)
    station[:station_id] = station[:station_id].to_i
    station[:installation_date] = DateTime.strptime(station[:installation_date], "%m/%d/%Y").strftime("%F")
    city.stations.create(station)
  end
  Station.create!(name: "San Jose Government Center", dock_count: 15, city_id: 1, installation_date: DateTime.strptime("8/12/2013","%m/%d/%Y").strftime("%F"), station_id: 25)
  Station.create!(name: "Broadway at Main", dock_count: 15, city_id: 2, installation_date: DateTime.strptime("12/31/2013", "%m/%d/%Y").strftime("%F"), station_id: 80)
  Station.create!(name: "Post at Kearny", dock_count: 19, city_id: 5, installation_date: DateTime.strptime("8/19/2013", "%m/%d/%Y").strftime("%F"), station_id: 47)
  Station.create!(name: "Washington at Kearny", dock_count: 19, city_id: 5, installation_date: DateTime.strptime("8/19/2013", "%m/%d/%Y").strftime("%F"), station_id: 46)
end
#
#
# def seed_trips_database(file_path)
#
#   time = Time.now
#
#   csv = CSV.open(file_path, headers: true, header_converters: :symbol)
#
#   counter = 0
#
#   csv.each do |row|
#
#     Trip.transaction do
#
#     starting_station = Station.find_by(station_id: row[:start_station_id]).id
#
#     starting_date = BikeDate.find_or_create_by!(date: DateTime.strptime(row[:start_date], '%m/%d/%Y %H:%M')).id
#
#     ending_station = Station.find_by(station_id: row[:end_station_id]).id
#
#     ending_date = BikeDate.find_or_create_by!(date: DateTime.strptime(row[:end_date], '%m/%d/%Y %H:%M')).id
#
#     trip_bike = Bike.find_or_create_by!(bike: row[:bike_id].to_i).id
#
#     trip_subscription = Subscription.find_or_create_by!(subscription_type: row[:subscription_type]).id
#
#     trip_zip = ZipCode.find_or_create_by!(zip_code: row[:zip_code].to_i).id
#
#     new_trip = Trip.create!({duration: row[:duration].to_i,
#                               start_station: starting_station,
#                               start_date: starting_date,
#                               end_station: ending_station,
#                               end_date: ending_date,
#                               bike_id: trip_bike,
#                               subscription_type: trip_subscription,
#                               zip_code: trip_zip})
#     end
#
#     puts counter += 1
#
#   end
#
#   system 'Say "Finished Seeding Trips Database!"'
#   puts Time.now - time
# end

# def seed_weather_database(file_path)
#
#   time = Time.now
#
#   counter = 0
#
#   CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
#
#     row = row.to_h
#
#     Condition.transaction do
#
#     row[:date_id] = BikeDate.bike_date_create(row.delete(:date))
#
#     row[:max_temp] = row.delete(:max_temperature_f).to_i
#
#     row[:mean_temp] = row.delete(:mean_temperature_f).to_i
#
#     row[:min_temp] = row.delete(:min_temperature_f).to_i
#
#     row[:mean_humidity] = row.delete(:mean_humidity).to_i
#
#     row[:mean_visibility] = row.delete(:mean_visibility_miles).to_i
#
#     row[:mean_wind_speed] = row.delete(:mean_wind_speed_mph).to_i
#
#     row[:precipitation] = row.delete(:precipitation_inches).to_i
#
#     row.delete_if {|key, value| key == :max_dew_point_f || key == :mean_dew_point_f || key == :min_dew_point_f || key == :min_humidity || key == :max_humidity || key == :max_sea_level_pressure_inches || key == :mean_sea_level_pressure_inches || key == :min_sea_level_pressure_inches || key == :max_visibility_miles || key == :min_visibility_miles || key == :max_wind_speed_mph || key == :max_gust_speed_mph || key == :cloud_cover || key == :events || key == :wind_dir_degrees || key == :zip_code}
#
#      Condition.create!(row)
#
#   end
#   puts counter += 1
#
#   end
#   system 'Say "Finished Seeding Weather Database!"'
#   puts Time.now - time
# end

seed_city_database("./db/csv/station.csv")
seed_station_database("./db/csv/station.csv")
# seed_trips_database("./db/csv/trip.csv")
# seed_weather_database("./db/csv/weather.csv")
