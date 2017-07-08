RSpec.describe "User visits station dashboard and" do

  before :each do
    @city = City.create!(city: "San Jose")
    @station_one = Station.create!(name: "San Jose Civic Center", dock_count: 11, city_id: @city.id,
                              installation_date: "2017-08-30")
    @station_two = Station.create!(name: "San Jose Civic Center", dock_count: 11, city_id: @city.id,
                              installation_date: "2017-08-30")
  end

  it "sees total stations" do
    visit '/stations-dashboard'

    expect(page).to have_content(Station.total_stations)
  end

  it "sees average bikes per station" do
    visit '/stations-dashboard'

    expect(page).to have_content(Station.average_bikes_per_station.to_i)
  end

  it "sees Stations with most bikes" do
    visit '/stations-dashboard'

    expect(page).to have_content(Station.most_available)
    expect(page).to have_content(Station.stations_with_most_bikes_available.first.name)
  end

  it "sees stations with least bikes" do
    visit '/stations-dashboard'

    expect(page).to have_content(Station.least_available)
    expect(page).to have_content(Station.stations_with_least_bikes_available.first.name)
  end

  it "sees Most recent installed stations" do
    visit '/stations-dashboard'

    expect(page).to have_content(Station.most_recent_install_station.first.name)
  end

  it "sees Oldest Station" do
    visit '/stations-dashboard'

    expect(page).to have_content(Station.oldest_installed_station.first.name)
  end

end
