RSpec.describe "User Creates a new station" do
  it "sees a form with name, city, dock count, and installation date" do

    visit '/stations/new'

    expect(page).to have_content("Name")
    expect(page).to have_content("Dock Count")
    expect(page).to have_content("City")
    expect(page).to have_content("Installation Date")
  end

  it "gets an error when submiting a form without filling in the name field" do

    visit '/stations/new'

    fill_in 'station[dock_count]', with: 33
    fill_in 'station[installation_date]', with: "2018-04-06"

    find_button('Create New Station').click

    expect(page).to have_content('ERROR')
  end

  it "sees a link to all trips, all stations, and the homepage" do

    visit '/stations/new'

    expect(page).to have_content("All Trips")
    expect(page).to have_content("All Stations")
    expect(page).to have_content("Home")
  end


end
