RSpec.describe "User visits weather dashboard and" do

  it "sees rides by temperature" do
    # When I visit the station dashboard page
    visit '/weather-dashboard'
    # I should see a total number of stations
    expect(page).to have_content('Highest')
    expect(page).to have_content('Lowest')
    expect(page).to have_content('Average')
    expect(page).to have_content('Rides')
    expect(page).to have_content('10 Degrees')
  end

  it "sees rides by precipitation" do
    # When I visit the station dashboard page
    visit '/weather-dashboard'
    # I should see a total number of stations
    expect(page).to have_content('Highest')
    expect(page).to have_content('Lowest')
    expect(page).to have_content('Average')
    expect(page).to have_content('Rides')
    expect(page).to have_content('Precipitation')
  end

  it "sees rides by wind speed" do
    # When I visit the station dashboard page
    visit '/weather-dashboard'
    # I should see a total number of stations
    expect(page).to have_content('Highest')
    expect(page).to have_content('Lowest')
    expect(page).to have_content('Average')
    expect(page).to have_content('Rides')
    expect(page).to have_content('Wind Speed')
  end

  it "sees rides by visbility" do
    # When I visit the station dashboard page
    visit '/weather-dashboard'
    # I should see a total number of stations
    expect(page).to have_content('Highest')
    expect(page).to have_content('Lowest')
    expect(page).to have_content('Average')
    expect(page).to have_content('Rides')
    expect(page).to have_content('Visibility')
  end

  it "sees highest rides by day" do
    # When I visit the station dashboard page
    visit '/weather-dashboard'
    # I should see a total number of stations
    expect(page).to have_content('Highest Rides by Day')
  end

  it "sees lowest rides by day" do
    # When I visit the station dashboard page
    visit '/weather-dashboard'
    # I should see a total number of stations
    expect(page).to have_content('Lowest Rides by Day')
  end

end
