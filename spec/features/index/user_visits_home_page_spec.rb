RSpec.describe "User visits Home page" do
  it "sees link to all stations" do
    # As a user
    # When I visit the home page
    visit '/'
    # I should see a link to all stations
    expect(page).to have_content("Stations")
  end

  it "sees link to all trips" do
    # As a User
    #When I visit the Home page
    visit '/'

    expect(page).to have_content("All Trips")
  end

  it "see welcome message that makes them happy" do
    visit '/'

    expect(page).to have_content("Welcome to Bike Share App")
  end
end
