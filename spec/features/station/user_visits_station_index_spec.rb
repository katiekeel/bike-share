RSpec.describe "User visits station index page and" do

  before :each do
    @city = City.create(city: "San Jose")
    @station = Station.create(name: "San Jose Civic Center", dock_count: 11, city_id: @city.id,
                              installation_date: "2017-08-30")
    @station_2 = Station.create(name: "Next New Station", dock_count: 1, city_id: @city.id,
                              installation_date: "2017-08-30")
  end

  it "clicks the link to create a new station" do
    visit '/stations'

    click_link("Create New Station")

    expect(current_path).to eq("/stations/new")
    expect(page).to have_content("Create New Station")
  end

  it "clicks the link to the first station" do

    visit '/stations'

    click_link("#{@station.name}")

    expect(current_path).to eq("/stations/#{@station.id}")
    expect(page).to have_content("San Jose Civic Center")
  end

  it "clicks the edit link on the first station" do

    visit '/stations'

    first(:link, 'Edit').click

    expect(current_path).to eq("/stations/#{@station.id}/edit")
    expect(page).to have_content("Edit Station")
  end

  it "clicks the delete button for the first station" do

    visit '/stations'

    first(:button, 'Delete').click

    expect(current_path).to eq "/stations"
    expect(page).to_not have_content("San Jose Civic Center")

  end
end
