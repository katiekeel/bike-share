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
    expect(page).to have_content((Trip.average_duration_of_a_ride / 60).round(2))
  end

  it "sees longest ride" do
    visit '/trips-dashboard'

    expect(page).to have_content("Longest Ride")
    expect(page).to have_content(Trip.longest_duration_of_a_ride)
  end

  it "sees shortest ride" do
    visit '/trips-dashboard'

    expect(page).to have_content("Shortest Ride")
    expect(page).to have_content(Trip.shortest_duration_of_a_ride)
  end

  it "sees the station that had the most beginning rides" do
    visit '/trips-dashboard'

    expect(page).to have_content("Stations With Most Rides Beginning @")
    expect(page).to have_content(Trip.start_station_with_most_rides)
  end

  it "sees the station that most rides" do
    visit '/trips-dashboard'

    expect(page).to have_content("Stations With Most Rides Ending @")
    expect(page).to have_content(Trip.end_station_with_most_rides)
  end

  it "sees monthly breakdown of rides" do
    visit '/trips-dashboard'

    expect(page).to have_content("Trips by Month")
  end

  it "sees most ridden bike" do
    visit '/trips-dashboard'

    expect(page).to have_content("Most Ridden Bike")
    expect(page).to have_content(Trip.most_ridden_bike)
    expect(page).to have_content(Trip.total_rides_for_most_ridden_bike)
  end

  it "sees most least ridden bike" do
    visit '/trips-dashboard'

    expect(page).to have_content("Least Ridden Bike")
    expect(page).to have_content(Trip.least_ridden_bike)
    expect(page).to have_content(Trip.total_rides_for_least_ridden_bike)
  end

  it "sees date with highest number of rides" do
    visit '/trips-dashboard'

    expect(page).to have_content("Highest Number of Trips")
    expect(page).to have_content(Trip.date_with_most_trips.strftime("%b %d, %Y"))
    expect(page).to have_content(Trip.number_of_trips_on_day_with_most_trips)
  end

  it "sees date with lowest number of rides" do
    visit '/trips-dashboard'

    expect(page).to have_content("Lowest Number of Trips")
    expect(page).to have_content(Trip.date_with_least_trips.strftime("%b %d, %Y"))
    expect(page).to have_content(Trip.number_of_trips_on_day_with_least_trips)
  end

  it "sees user subscription type and breakdown" do
    visit '/trips-dashboard'

    expect(page).to have_content("Customers")
    expect(page).to have_content(Subscription.number_of_customers)
    expect(page).to have_content("Subscribers")
    expect(page).to have_content(Subscription.number_of_subscribers)
    expect(page).to have_content("Percentage of Subscribers")
    expect(page).to have_content(Subscription.percentage_of_subscribers)
  end

end
