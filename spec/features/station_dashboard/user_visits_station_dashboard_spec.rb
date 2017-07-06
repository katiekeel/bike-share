RSpec.describe "User visits station dashboard and" do

  before :each do
    @city = City.create!(city: "San Jose")
    @station_one = Station.create!(name: "San Jose Civic Center", dock_count: 11, city_id: @city.id,
                              installation_date: "2017-08-30")
    @station_two = Station.create!(name: "San Jose Civic Center", dock_count: 11, city_id: @city.id,
                              installation_date: "2017-08-30")
  end

  it "sees total stations" do
    visit '/stations/stations-dashboard'

    expect(page).to have_content('Total Number of Stations')
  end

  it "sees average bikes per station" do
    visit '/stations/stations-dashboard'

    expect(page).to have_content('Average Bikes Per Station')
  end

  it "sees Stations with most bikes" do
    visit '/stations/stations-dashboard'

    expect(page).to have_content("Stations With Most Bikes")
  end

  it "sees stations with least bikes" do
    visit '/stations/stations-dashboard'

    expect(page).to have_content('Stations With Least Bikes')
  end

  it "sees Most recent installed stations" do
    
    visit '/stations/stations-dashboard'

    expect(page).to have_content('Newest Station')
  end

  it "sees Oldest Station" do
    visit '/stations/stations-dashboard'

    expect(page).to have_content('Oldest Stations')
  end

end
