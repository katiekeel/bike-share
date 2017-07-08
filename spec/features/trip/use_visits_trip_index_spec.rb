RSpec.describe "User visits Trips page and" do

  before :each do
    @city = City.create(city: "San Jose")
    @station = Station.create(name: "Station", dock_count: 1, city_id: @city.id, installation_date: "2017-08-13")
    @date = BikeDate.bike_date_create("8/29/2013 14:14")
    @bike = Bike.create(bike: 23)
    @subscription = Subscription.create(subscription_type: "Customer")
    @zip_code = ZipCode.create(zip_code: 90283)
    @trip = Trip.create(duration: 63, start_date: @date, start_station: @station.id, end_date: @date, end_station: @station.id, bike_id: @bike.id, subscription_type: @subscription.id, zip_code: @zip_code.id)
  end

  it "clicks create new trip" do
    visit '/trips'

    click_link("Create New Trip")

    expect(current_path).to eq("/trips/new")
    expect(page).to have_content("Create New Trip")
  end

  it "clicks first trip id link" do
    visit '/trips'

    save_and_open_page

    click_link("#{@trip.id}")

    expect(current_path).to eq("/trips/#{@trip.id}")
    expect(page).to have_content("#{@trip.id}")
    expect(page).to have_content("#{@trip.duration}")
  end

  it "clicks first trip edit link" do

    visit '/trips'

    click_link("Edit")

    expect(current_path).to eq("/trips/#{@trip.id}/edit")
    expect(page).to have_content("Edit A Trip")
  end

  it "clicks first trip delete button" do

    visit '/trips'

    click_button("Delete")

    expect(current_path).to eq("/trips")
    expect(page).to_not have_content("#{@trip.id}")
  end
end
