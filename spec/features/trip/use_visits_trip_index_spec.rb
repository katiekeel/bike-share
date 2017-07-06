RSpec.describe "User visits Trips page" do

  before :each do
    @trip = Trip.create(duration: 63, start_date: 8, start_station: 13, end_date: 24, end_station: 23, bike_id: 10, subscription_type: 19, zip_code: 19)
  end

  it "sees column headers" do

    visit '/trips'

    expect(page).to have_content("Trip Start")
    expect(page).to have_content("Trip End")
    expect(page).to have_content("Trip Duration")
    expect(page).to have_content("Starting Station")
    expect(page).to have_content("Ending Station")
    expect(page).to have_content("Bike Id")
    expect(page).to have_content("Subscription Type")
    expect(page).to have_content("Zipcode")
  end

  it "sees link to homepage and edit button" do

    visit '/trips'

    page.should have_selector(:link_or_button, 'Home')
    page.should have_selector(:link_or_button, 'Edit')
  end


  it "takes you to the individual trips view when you click edit" do

    visit '/trips'

    click_link("Edit")

    expect(current_path).to eq("/trips/#{@trip.id}/edit")
    expect(page).to have_content("Edit")
  end

  it "sees a delete button for each trips" do

    visit '/trips'

    expect(page).to have_button('Delete')
  end

  it "takes you back to the tripsindex page when you click delete" do

    visit '/trips'

    click_button('Delete')

    expect(current_path).to eq "/trips"
    expect(page).to have_content("Trip Index")
  end

  #should add tests for pagination and ordered by date

end
