RSpec.describe "User visits trip dashboard and" do

  before :each do
    @city = City.create!(city: "San Jose")
    @trip_one = trip.create!(name: "San Jose Civic Center", dock_count: 11, city_id: @city.id,
                              installation_date: "2017-08-30")
    @trip_two = trip.create!(name: "San Jose Civic Center", dock_count: 11, city_id: @city.id,
                              installation_date: "2017-08-30")
  end

  it "sees total trips" do
    # When I visit the trip dashboard page
    visit '/trips-dashboard'
    # I should see a total number of trips
    expect(page).to have_content('Total Number of trips')
  end

  it "sees average bikes per trip" do
    # When I visit the trip dashboard page
    visit '/trips-dashboard'
    # I should see a total number of trips
    expect(page).to have_content('Average Bikes Per trip')
  end

  it "sees trips with most bikes" do
    # When I visit the trip dashboard page
    visit '/trips-dashboard'
    # I should see a total number of trips
    expect(page).to have_content("trips With Most Bikes")
  end

  it "sees trips with least bikes" do
    # When I visit the trip dashboard page
    visit '/trips-dashboard'
    # I should see a total number of trips
    expect(page).to have_content('trips With Least Bikes')
  end

  it "sees Most recent installed trips" do
    # When I visit the trip dashboard page
    visit '/trips-dashboard'
    # I should see a total number of trips
    expect(page).to have_content('Newest trip')
  end

  it "sees Oldest trip" do
    # When I visit the trip dashboard page
    visit '/trips-dashboard'
    # I should see a total number of trips
    expect(page).to have_content('Oldest trips')
  end

end
