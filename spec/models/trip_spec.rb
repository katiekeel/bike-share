RSpec.describe Trip do
  before :each do
    @city_1 = City.create(city: "San Jose")
    @city_2 = City.create(city: "Redwood")

    @start_date = BikeDate.create(date: "2014-04-05 10:16:00 UTC")
    @end_date = BikeDate.create(date: "2014-04-05 12:16:00 UTC")

    @start_station = Station.create(name: "Civic Center", dock_count: 30,
    city_id: @city_1.id, installation_date: "2017-08-30")
    @end_station = Station.create(name: "San Pedro", dock_count: 11,
    city_id: @city_2.id, installation_date: "2017-08-30")

    @bike_id = Bike.create(bike: 1)
    @bike_2 = Bike.create(bike: 2)

    @subscription_type = Subscription.create(subscription_type: "Customer")

    @zip_code = ZipCode.create(zip_code: 99999)

    @trip_1 = Trip.create(duration: 100, start_date: @end_date.id, start_station: @end_station.id,
    end_station: @start_station.id, end_date: @start_date.id,
    bike_id: @bike_id.id, subscription_type: @subscription_type.id, zip_code: @zip_code.id)

    @trip_2 = Trip.create(duration: 200, start_date: @start_date.id, start_station: @start_station.id,
    end_station: @end_station.id, end_date: @end_date.id,
    bike_id: @bike_2.id, subscription_type: @subscription_type.id, zip_code: @zip_code.id)

    @trip_3 = Trip.create(duration: 400, start_date: @start_date.id, start_station: @start_station.id,
    end_station: @end_station.id, end_date: @end_date.id,
    bike_id: @bike_id.id, subscription_type: @subscription_type.id, zip_code: @zip_code.id)

    @trip_4 = Trip.create(duration: 300, start_date: @start_date.id, start_station: @start_station.id,
    end_station: @end_station.id, end_date: @end_date.id,
    bike_id: @bike_id.id, subscription_type: @subscription_type.id, zip_code: @zip_code.id)
  end

  describe "Validations" do
    it "is invalid without a duration" do
      trip = Trip.create(start_date: @start_date.id, start_station: @start_station.id,
        end_station: @end_station.id, end_date: @end_date.id,
        bike_id: @bike_id.id, subscription_type: @subscription_type.id, zip_code: @zip_code.id)

      expect(trip).to_not be_valid
    end
  end

    it "is invalid without a start date" do
      trip = Trip.create(duration: 100, start_station: @start_station.id,
        end_station: @end_station.id, end_date: @end_date.id,
        bike_id: @bike_id.id, subscription_type: @subscription_type.id, zip_code: @zip_code.id)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start station" do


     trip = Trip.create(duration: 100, start_date: @start_date.id, end_date: @end_date.id,
        end_station: @end_station.id, bike_id: @bike_id.id, subscription_type: @subscription_type.id, zip_code: @zip_code.id)


      expect(trip).to_not be_valid
    end

    it "is invalid without an end date" do
      trip = Trip.create(duration: 100, start_date: @start_date.id, start_station: @start_station.id,
      end_station: @end_station.id, bike_id: @bike_id.id, subscription_type: @subscription_type.id,
      zip_code: @zip_code.id)

      expect(trip).to_not be_valid
    end

    it "is invalid without an end station" do
      trip = Trip.create(duration: 100, start_date: @start_date.id, start_station: @start_station.id,
      end_date: @end_date.id, bike_id: @bike_id.id, subscription_type: @subscription_type.id,
      zip_code: @zip_code.id)

      expect(trip).to_not be_valid
    end

    it "is invalid without a bike id" do
      trip = Trip.create(duration: 100, start_date: @start_date.id, start_station: @start_station.id,
      end_station: @end_station.id, subscription_type: @subscription_type.id,
      zip_code: @zip_code.id)

      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription id" do
      trip = Trip.create(duration: 100, start_date: @start_date.id, start_station: @start_station.id,
      end_station: @end_station.id, end_date: @end_date.id,
      bike_id: @bike_id.id, zip_code: @zip_code.id)

      expect(trip).to_not be_valid
    end

    it "is valid without a zipcode" do
      trip = Trip.create(duration: 100, start_date: @start_date.id, start_station: @start_station.id,
      end_station: @end_station.id, end_date: @end_date.id, bike_id: @bike_id.id,
      subscription_type: @subscription_type.id)

      expect(trip).to be_valid
    end

    describe "Class methods" do
      it "shows the average duration of a ride" do
        average = Trip.average_duration_of_a_ride

        expect(average).to eq(250)
      end

      it "shows the longest ride taken" do
        longest = Trip.longest_duration_of_a_ride

        expect(longest).to eq(400)
      end

      it "shows the shortest ride taken" do
        shortest = Trip.shortest_duration_of_a_ride

        expect(shortest).to eq(100)
      end

      it "shows the station where the most rides started" do
        most_rides_begun = Trip.start_station_with_most_rides

        expect(most_rides_begun).to eq(@start_station.name)
      end

      it "shows the station where the most rides ended" do
        most_rides_ending = Trip.end_station_with_most_rides

        expect(most_rides_ending).to eq(@end_station.name)
      end

      it "shows most ridden bike" do
        most_ridden_bike = Trip.most_ridden_bike

        expect(most_ridden_bike).to eq(@bike_id.id)
      end

      it "it shows total number of rides for most ridden bike" do

        total_rides = Trip.total_rides_for_most_ridden_bike

        expect(total_rides).to eq(3)

      end

      it "it shows least ridden bike" do
        least_ridden_bike = Trip.least_ridden_bike

        expect(least_ridden_bike).to eq(@bike_2.id)
      end

      it "it shows total number of rides for least ridden bike" do
        total_rides = Trip.total_rides_for_least_ridden_bike

        expect(total_rides).to eq(1)
      end

      it "shows single date of most trips" do
        date = Trip.date_with_most_trips

        expect(date).to eq("5/4/2014 10:16")
    end

      it "shows count form highest date" do
        count = Trip.number_of_trips_on_day_with_most_trips

        expect(count).to eq(3)
      end

      it "shows single date of least trips" do
        date = Trip.date_with_least_trips

        expect(date).to eq("5/4/2014 12:16")
    end

       it "shows count from least-ride date" do
        count = Trip.number_of_trips_on_day_with_least_trips

        expect(count).to eq(1)
      end

      it "shows number of rides from this station" do
        num_of_rides = Trip.trips_from_starting(@start_station.id)

        expect(num_of_rides).to eq(3)
      end
      it "shows number of rides to this station" do
        num_of_rides = Trip.trips_from_ending(@start_station.id)

        expect(num_of_rides).to eq(1)
      end

      it "shows most frequent destination from this station" do
        destination = Trip.most_frequent_destination_from(@start_station.id)

        expect(destination).to eq("San Pedro")
      end

      it "shows most frequent origin form rides ending at this station" do
        destination = Trip.most_frequent_origin_for_rides_ending_at(@end_station.id)

        expect(destination).to eq("Civic Center")
      end

      it "shows date with hightest number of trips from this station" do
        day = Trip.date_for_highest_number_of_trips_from(@start_station.id)

        expect(day).to eq("2014-04-05 10:16:00 UTC")
      end

      it "shows most frequently used zip code for users from this station" do
        zip_code = Trip.frequently_used_zip_code_for_users_from(@start_station.id)

        expect(zip_code).to eq(99999)
      end

      it "shows most frequently used bike id from this station" do
        bike_id = Trip.frequently_used_bike_id_from(@start_station.id)

        expect(bike_id).to eq(1)
      end


  end
end
