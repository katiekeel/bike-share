RSpec.describe "User visits individual station" do
  before :each do
    @city_1 = City.create(city: "San Jose")
    @city_2 = City.create(city: "Redwood")

    @station_1 = Station.create(name: "Civic Center", dock_count: 30,
    city_id: @city_1.id, installation_date: "2017-08-30")
  end

  it "from /stations/:id" do

    visit "/stations/#{@station_1.id}"

    expect(current_path).to eq("/stations/#{@station_1.id}")
    expect(page).to have_content("#{@station_1.name}")
    expect(page).to have_content("#{@station_1.dock_count}")
    expect(page).to have_content("#{@city_1.city}")
    expect(page).to have_content("#{@station_1.installation_date}")

    expect(page).to have_content("Number of Rides Starting")
    expect(page).to have_content("Number of Rides Ending")
    expect(page).to have_content("Frequent Destination from this Station")
    expect(page).to have_content("Frequent Origination to this Station")

    expect(page).to have_content("Highest Number of Trips")
    expect(page).to have_content("Frequently Used ZipCode")
    expect(page).to have_content("Frequently Used Bike ")
  end

  it "clicks edit link" do
    visit "/stations/#{@station_1.id}"

    click_link("Edit")

    expect(current_path).to eq("/stations/#{@station_1.id}/edit")
    expect(page).to have_content("Edit Station")
  end

  it "clicks delete button" do
    visit "/stations/#{@station_1.id}"

    click_button("Delete")

    expect(current_path).to eq("/stations")
    expect(page).to_not have_content("#{@station_1.name}")
  end
end
