RSpec.describe "User visits individual trip" do
  before :each do
    @city = City.create(city: "San Jose")
    @station = Station.create(name: "Adobe on Almaden", dock_count: 1, city_id: @city.id, installation_date: "2017-08-13")
    @date = BikeDate.bike_date_create("8/29/2013 14:14")
    @bike = Bike.create(bike: 520)
    @subscription = Subscription.create(subscription_type: "Subscriber")
    @zip_code = ZipCode.create(zip_code: 94217)
    @trip = Trip.create(duration: 60, start_date: @date, start_station: @station.id, end_date: @date, end_station: @station.id, bike_id: @bike.id, subscription_type: @subscription.id, zip_code: @zip_code.id)
  end

  it "from /trips/:id" do

    visit "/trips/#{@trip.id}"

    expect(current_path).to eq("/trips/#{@trip.id}")
    expect(page).to have_content("#{@trip.id}")
    expect(page).to have_content("#{@trip.duration}")
    expect(page).to have_content("#{@trip.start_station}")
  end

  it "clicks edit link" do
    visit "/trips/#{@trip.id}"

    click_link("Edit")

    expect(current_path).to eq("/trips/#{@trip.id}/edit")
    expect(page).to have_content("Edit A Trip")
  end

  it "clicks delete button" do
    visit "/trips/#{@trip.id}"

    click_button("Delete")

    expect(current_path).to eq("/trips")
    expect(page).to_not have_content("#{@trip.id}")
  end
end
