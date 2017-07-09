RSpec.describe "User visits home page and" do

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
  end

  it "sees welcome message that makes them happy" do

    visit '/'

    expect(page).to have_content("Welcome to BikeShareApp")
  end

  it "clicks navbar link to all stations" do

    visit '/'

    click_link("Stations")
    expect(current_path).to eq("/stations")
  end

  it "clicks navbar link to all trips" do

    visit '/'

    click_link("Trips")
    expect(current_path).to eq("/trips")
  end

  it "clicks navbar link to all weather conditions" do

    visit '/'

    click_link("Weather Conditions")
    expect(current_path).to eq("/conditions")
  end

  it "clicks navbar link to station dashboard" do

    visit '/'

    click_link("Station Dashboard")
    expect(current_path).to eq("/stations-dashboard")
  end

  it "clicks navbar link to trips dashboard" do

    visit '/'

    click_link("Trip Dashboard")
    expect(current_path).to eq("/trips-dashboard")
  end

  it "clicks navbar link to weather dashboard" do

    visit '/'

    click_link("Weather Dashboard")
    expect(current_path).to eq("/weather-dashboard")
  end

end
