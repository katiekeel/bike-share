RSpec.describe "User updates a station" do
  before :each do
    @city = City.create(city: "San Jose")
    @station = Station.create(name: "San Jose Civic Center", dock_count: 11, city_id: @city.id,
                              installation_date: "2017-08-30")
  end

  it "can update a station from /stations" do

    visit '/stations'

    click_link("Edit")

    fill_in "station[name]",              with: "Oakland"
    fill_in "station[dock_count]",        with: 18
    fill_in "station[city_id]",           with: @city.id
    fill_in "station[installation_date]", with: "2018-04-06"

    click_button("Submit")
    expect(current_path).to eq("/stations/#{@station.id}")
    expect(page).to have_content("2018-04-06")
  end

  it "can update a station from '/stations/:id/edit'" do

    visit "/stations/#{@station.id}/edit"

    fill_in "station[name]",              with: "Oakland"
    fill_in "station[dock_count]",        with: 18
    fill_in "station[city_id]",           with: @city.id
    fill_in "station[installation_date]", with: "2018-04-06"

    click_button("Submit")

    expect(current_path).to eq("/stations/#{@station.id}")
    expect(page).to have_content("Oakland")
  end

end
