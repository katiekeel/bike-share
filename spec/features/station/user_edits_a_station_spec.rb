RSpec.describe "User updates a station" do
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

  it "can update a station from /stations" do

    visit '/stations'

    first(:link, "Edit").click

    fill_in "station[name]",              with: "Oakland"
    fill_in "station[dock_count]",        with: 18
    fill_in "station[city_id]",           with: @city_1.id
    fill_in "station[installation_date]", with: "2018-04-06"

    click_button("Submit")
    expect(current_path).to eq("/stations/#{@start_station.id}")
    expect(page).to have_content("2018-04-06")
  end

  it "can update a station from '/stations/:id/edit'" do

    visit "/stations/#{@start_station.id}/edit"

    fill_in "station[name]",              with: "Oakland"
    fill_in "station[dock_count]",        with: 18
    fill_in "station[city_id]",           with: @city_1.id
    fill_in "station[installation_date]", with: "2018-04-06"

    click_button("Submit")

    expect(current_path).to eq("/stations/#{@start_station.id}")
    expect(page).to have_content("Oakland")
  end

end
