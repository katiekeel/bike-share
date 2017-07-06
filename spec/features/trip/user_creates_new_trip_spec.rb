RSpec.describe "User creates a new trip" do

  it "sees a form with duration, start date, start station, end date, end station, bike id, subscription type, and zip code" do

    visit '/trips/new'

    expect(page).to have_content("Duration")
    expect(page).to have_content("Start Date")
    expect(page).to have_content("Start Station")
    expect(page).to have_content("End Date")
    expect(page).to have_content("End Station")
    expect(page).to have_content("Bike ID")
    expect(page).to have_content("Subscription Type")
    expect(page).to have_content("Zip Code")
  end

  it "sees a link to all trips, all stations, and the home page" do

    visit '/trips/new'

    expect(page).to have_content("All Trips")
    expect(page).to have_content("All Stations")
    expect(page).to have_content("Home")
  end

end
