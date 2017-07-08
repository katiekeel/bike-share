RSpec.describe Condition do

  before :each do
    @date = BikeDate.create(date: '2012/12/12')

    @city_1 = City.create(city: "San Jose")

    @start_date = BikeDate.create(date: "2014-04-05 10:16:00 UTC")
    @end_date = BikeDate.create(date: "2014-04-05 12:16:00 UTC")

    @start_station = Station.create(name: "Civic Center", dock_count: 30,
    city_id: @city_1.id, installation_date: "2017-08-30")
    @end_station = Station.create(name: "San Pedro", dock_count: 11,
    city_id: @city_1.id, installation_date: "2017-08-30")

    @bike_id = Bike.create(bike: 1)

    @subscription_type = Subscription.create(subscription_type: "Customer")

    @zip_code = ZipCode.create(zip_code: 99999)

    @trip_1 = Trip.create(duration: 100, start_date: @end_date.id, start_station: @end_station.id,
    end_station: @start_station.id, end_date: @start_date.id,
    bike_id: @bike_id.id, subscription_type: @subscription_type.id, zip_code: @zip_code.id)

    @weather_1 = Condition.create(date_id: @date.id, max_temp: 60, mean_temp: 55, min_temp: 50,
              mean_humidity: 35, mean_visibility: 15, mean_wind_speed: 22, precipitation: 3)

    @weather_2 = Condition.create(date_id: @date.id,max_temp: 58, mean_temp: 53, min_temp: 51,
              mean_humidity: 35, mean_visibility: 8, mean_wind_speed: 20, precipitation: 0)

    @weather_3 = Condition.create(date_id: @date.id,max_temp: 59, mean_temp: 57, min_temp: 54,
              mean_humidity: 35, mean_visibility: 10, mean_wind_speed: 28, precipitation: 1)
  end

  describe "Validations" do
    it "is invalid without a date_id" do

      weather = Condition.create(max_temp: 77, mean_temp: 78, min_temp: 65,
                                mean_humidity: 35, mean_visibility: 10,
                                mean_wind_speed: 22, precipitation: 12)

      expect(weather).to_not be_valid
    end

    it "is invalid without a max temperature" do

      weather = Condition.create(date_id: @date.id, mean_temp: 78, min_temp: 65, mean_humidity: 35, mean_visibility: 10, mean_wind_speed: 22, precipitation: 12)

      expect(weather).to_not be_valid
    end

    it "is invalid without a mean temperature" do

      weather = Condition.create(date_id: @date.id, max_temp: 78, min_temp: 65, mean_humidity: 35, mean_visibility: 10, mean_wind_speed: 22, precipitation: 12)

      expect(weather).to_not be_valid
    end

    it "is invalid without a min temperature" do

      weather = Condition.create(date_id: @date.id, mean_temp: 78, max_temp: 65, mean_humidity: 35, mean_visibility: 10, mean_wind_speed: 22, precipitation: 12)

      expect(weather).to_not be_valid
    end

    it "is invalid without a mean humiditiy" do

      weather = Condition.create(date_id: @date.id, mean_temp: 78, max_temp: 65, min_temp: 66, mean_visibility: 10, mean_wind_speed: 22, precipitation: 12)

      expect(weather).to_not be_valid
    end

    it "is invalid without a mean visibility" do

      weather = Condition.create(date_id: @date.id, mean_temp: 78, max_temp: 65, min_temp: 66, mean_humidity: 35, mean_wind_speed: 22, precipitation: 12)

      expect(weather).to_not be_valid
    end

    it "is invalid without a mean wind speed" do

      weather = Condition.create(date_id: @date.id, mean_temp: 78, max_temp: 65, min_temp: 66, mean_humidity: 35, mean_visibility: 10, precipitation: 12)

      expect(weather).to_not be_valid
    end

    it "is invalid without a precipitation input" do

      weather = Condition.create(date_id: @date.id, mean_temp: 78, max_temp: 65, min_temp: 66, mean_humidity: 35, mean_visibility: 10, mean_wind_speed: 22)

      expect(weather).to_not be_valid
    end
  end

  describe "Class methods" do
    it "shows average number of rides for days with high temp in 10 degree chunks" do
      average = Condition.average_rides_for_high_temps

      expect(average).to eq()

  end
end


Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees)
