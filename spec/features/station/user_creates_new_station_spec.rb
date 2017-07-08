RSpec.describe "User Creates a new station" do

  before :each do
    City.create(city: "San Jose")
  end

  it "with valid attributes" do
    visit '/stations/new'

    fill_in('station[name]', :with => "New Station")
    select 'San Jose', :from => "station[city_id]"
    fill_in('station[installation_date]', :with => 12-12-12)
    fill_in('station[dock_count]', :with => 33)

    find_button('Create New Station').click

    station = Station.last

    expect(current_path).to eq("/stations/#{station.id}")

    expect(page).to have_content("New Station")
    expect(page).to have_content("San Jose")
  end

  it "with missing attributes" do
    visit '/stations/new'

    fill_in('station[installation_date]', :with => 12-12-12)
    fill_in('station[dock_count]', :with => 33)

    find_button('Create New Station').click

    expect(current_path).to eq("/stations")

    expect(page).to have_content('ERROR')
  end

end
