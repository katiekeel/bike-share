RSpec.describe "User visits station index page and" do

  it "sees link back to home page" do
    # When I visit the station index page
    visit '/stations'
    # I should see a link back to the home page
    page.should have_selector(:link_or_button, 'Home')
  end

  it "sees a list of stations" do
    station = Station.create(name: "One", dock_count: 1, city_id: 1, installation_date: "2017-08-30")
    # When I visit the station index page
    visit '/stations'
    # I should see a list of all stations
    page.should have_selector(:link_or_button, 'One')
  end

  it "sees an edit button for each station" do
    station = Station.create(name: "One", dock_count: 1, city_id: 1, installation_date: "2017-08-30")
    visit '/stations'
    # I should see an edit button for each station
    page.should have_selector(:link_or_button, 'Edit')
  end

  it "takes you to the individual station view when you click edit" do
    station = Station.create(name: "One", dock_count: 1, city_id: 1, installation_date: "2017-08-30")
    visit '/stations'
    # Click the edit button for each station
    click_button('Edit')

    expect(current_path).to eq "/stations/1"
    expect(page).to have_content "One"
  end

  it "sees a delete button for each station" do
    station = Station.create(name: "One", dock_count: 1, city_id: 1, installation_date: "2017-08-30")
    visit '/stations'
    expect(page).to have_button('Delete')
  end

  it "takes you back to the station index page when you click delete" do
    station = Station.create(name: "One", dock_count: 1, city_id: 1, installation_date: "2017-08-30")
    visit '/stations'
    click_button('Delete')
    expect(current_path).to eq "/stations"
    expect(page).to_not have_content "One"
  end
end
