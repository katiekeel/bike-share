RSpec.describe Condition do

  before :each do
    @date = BikeDate.create(date: '2012/12/12')
  end

  describe "Validations" do
    it "is invalid without a date_id" do

      weather = Condition.create(
        max_temp: 77,
        mean_temp: 78,
        min_temp: 65,
        mean_humidity: 35,
        mean_visibility: 10,
        mean_wind_speed: 22,
        precipitation: 12
      )

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
end
