RSpec.describe "User updates a station" do

  before :each do
    @city_1 = City.create(city: "San Jose")

    @station_1 = Station.create(name: "Civic Center", dock_count: 30,
    city_id: @city_1.id, installation_date: "2017-08-30")
  end

  it "from /stations" do

    visit '/stations'

    first(:link, "Edit").click

    fill_in "station[name]",              with: "Oakland"
    fill_in "station[dock_count]",        with: 18
    fill_in "station[city_id]",           with: @city_1.city
    fill_in "station[installation_date]", with: "2018-04-06"

    click_button("Submit")

    expect(current_path).to eq("/stations/#{@station_1.id}")
    expect(page).to have_content("2018-04-06")
  end

  it "from /stations/:id/edit" do

    visit "/stations/#{@station_1.id}/edit"

    fill_in "station[name]",              with: "Oakland"
    fill_in "station[dock_count]",        with: 18
    fill_in "station[city_id]",           with: @city_1.city
    fill_in "station[installation_date]", with: "2018-04-06"

    click_button("Submit")

    expect(current_path).to eq("/stations/#{@station_1.id}")
    expect(page).to have_content("Oakland")
  end

end
