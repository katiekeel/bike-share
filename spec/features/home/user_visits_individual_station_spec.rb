RSpec.describe "User visits individual station" do
  it "sees individual station" do

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


    visit "/stations/#{@start_station.id}"

    expect(current_path).to eq("/stations/#{@start_station.id}")
    expect(page).to have_content("#{@start_station.name}")
    expect(page).to have_content("#{@start_station.dock_count}")
    expect(page).to have_content("#{@city_1.city}")
    expect(page).to have_content("#{@start_station.installation_date}")

    expect(page).to have_content("Number of Rides Starting")
    expect(page).to have_content("Number of Rides Ending")
    expect(page).to have_content("Frequent Destination from this Station")
    expect(page).to have_content("Frequent Origination to this Station")

    expect(page).to have_content("Highest Number of Trips")
    expect(page).to have_content("Frequently Used ZipCode")
    expect(page).to have_content("Frequently Used Bike ")
  end
end
