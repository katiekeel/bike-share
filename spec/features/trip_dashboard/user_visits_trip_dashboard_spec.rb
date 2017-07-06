RSpec.describe "User visits trip dashboard and" do

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

  it "sees average duration of a ride" do
    visit '/trips-dashboard'

    expect(page).to have_content("Average Ride Duration")
  end

  it "sees longest ride" do
    visit '/trips-dashboard'

    expect(page).to have_content("Longest Ride")
  end

  it "sees shortest ride" do
    visit '/trips-dashboard'

    expect(page).to have_content("Shortest Ride")
  end

  it "sees the station that had the most beginning rides" do
    visit '/trips-dashboard'

    expect(page).to have_content("Stations With Most Rides Beginning @")
  end

  it "sees the station that most rides" do
    visit '/trips-dashboard'

    expect(page).to have_content("Stations With Most Rides Ending @")
  end

  it "sees monthly breakdown of rides" do
    visit '/trips-dashboard'

    expect(page).to have_content("Monthly Breakdown")
  end

  it "sees most ridden bike" do
    visit '/trips-dashboard'

    expect(page).to have_content("Most Ridden Bike")
  end

  it "sees most least ridden bike" do
    visit '/trips-dashboard'

    expect(page).to have_content("Least Ridden Bike")
  end

  it "sees user subscription type and breakdown" do
    visit '/trips-dashboard'

    expect(page).to have_content("Subscribers")
  end

  it "sees date with highest number of rides" do
    visit '/trips-dashboard'

    expect(page).to have_content("Highest Number of Trips")
  end

  it "sees date with lowest number of rides" do
    visit '/trips-dashboard'

    expect(page).to have_content("Lowest Number of Trips")
  end
end
