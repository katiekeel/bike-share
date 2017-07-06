RSpec.describe "User visits Home page" do
  it "sees link to all stations" do

    visit '/'

    expect(page).to have_content("Stations")
  end

  it "sees link to all trips" do

    visit '/'

    expect(page).to have_content("All Trips")
  end

  it "see welcome message that makes them happy" do

    visit '/'

    expect(page).to have_content("Bike Share App")
  end
end
