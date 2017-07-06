RSpec.describe "User edits trip information" do

  before :each do
    @city = City.create(city: "San Jose")
    @station_1 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                    city_id: @city.id, installation_date: "2017-08-30")
    @station_2 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                  city_id: @city.id, installation_date: "2017-08-30")
    @trip = Trip.create(duration: 174, start_date: "8/29/2013", start_station: @station_2.id,
                        end_station: @station_1.id, end_date: "8/29/2013",
                        bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)
  end

  it "can edit a trip from '/trips'" do

    # visit '/trips'
    #
    # click_link("Edit")
    #
    # fill_in "trip[duration]",           with: 500
    # fill_in "trip[start_date]",         with: "9/29/2013"
    # fill_in "trip[start_station]",      with: @station_1.id
    # fill_in "trip[end_station]",        with: @station_2.id
    # fill_in "trip[end_date]",           with:  "9/29/2013"
    # fill_in "trip[bike_id]",            with: 288
    # fill_in "trip[subscription_type]",  with: "Customer"
    # fill_in "trip[zip_code]",           with: 94114
    #
    # click_button("Edit")
    # expect(current_path).to eq("/trips/#{@trip.id}")
    # expect(page).to have_content(500)
    # expect(page).to have_content("Customer")
  end


  it "can edit a trip from '/trips/:id/edit'" do

    # visit "/trips/#{@trip.id}/edit"
    #
    # fill_in "trip[duration]",           with: 500
    # fill_in "trip[start_date]",         with: "9/29/2013"
    # fill_in "trip[start_station]",      with: @station_1.id
    # fill_in "trip[end_station]",        with: @station_2.id
    # fill_in "trip[end_date]",           with:  "9/29/2013"
    # fill_in "trip[bike_id]",            with: 288
    # fill_in "trip[subscription_type]",  with: "Customer"
    # fill_in "trip[zip_code]",           with: 94114
    #
    # click_button("Submit")
    #
    # expect(current_path).to eq("/trips/#{@trip.id}")
    # expect(page).to have_content("9/29/2013")
  end

end
