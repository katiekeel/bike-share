RSpec.describe "User Creates a new station" do
  it "sees a form with name, city, dock count, and installation date" do
    visit '/stations/new'
    # I should see a link to all stations
    expect(page).to have_content("Name")
    expect(page).to have_content("City")
  end

  # it "sees a drop down of citys to select from"
  #   visit '/stations/new'
  #
  # end

  it "signs up with out filling out the name field to error" do
    visit '/stations/new'
    # select("San Jose", :from => 'City')
    fill_in('station[installation_date]', :with => 12-12-12)
    fill_in('station[dock_count]', :with => 33)
    find_button('Create New Station').click

    expect(page).to have_content('ERROR')
  end

  it "sees link to trips" do
    # As a User
    #When I visit the Home page
    visit '/stations/new'

    expect(page).to have_content("All Trips")
  end

  it "sees link to stations" do
    # As a User
    #When I visit the Home page
    visit '/stations/new'

    expect(page).to have_content("All Stations")
  end

  it "link to home page" do
    visit '/stations/new'

    expect(page).to have_content("Home")
  end
end
