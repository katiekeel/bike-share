RSpec.describe "User visits '/stations/:id/edit'" do
  it "can update a station" do

    station = Station.create(name: "Sand Jose", dock_count: 30, city_id: 1,
                             installation_date: "2013-04-06")

    visit "/stations/#{station.id}/edit"

    fill_in "station[name]",              with: "Oakland"
    fill_in "station[dock_count]",        with: 18
    fill_in "station[city_id]",           with: 2
    fill_in "station[installation_date]", with: "2018-04-06"

    click_button("Submit")

    expect(current_path).to eq("/stations/#{station.id}")
    expect(page).to have_content(18)
  end
end


# RSpec.describe "User visits '/stations'" do
#   it "can update a station" do
#
#     station = Station.create(name: "Sand Jose", dock_count: 30, city_id: 1,
#                              installation_date: "2013-04-06")
#
#     visit '/stations'
#     click_on("Update Station")
#
#     fill_in "station[name]",              with: "Oakland"
#     fill_in "station[dock_count]",        with: 18
#     fill_in "sation[city_id]",            with: 2
#     fill_in "station[installation_date]", with: "2018-04-06"
#
#     click_button("Submit")
#     expect(current_path).to eq("/stations/#{station.id}")
#     expect(page).to have_content("2018-04-06")
#   end
# end


# As a user
# When I visit the edit page
# And fill in station name, city_id, installation_date, dock_count
# And click Update
# I should be redirected to the index page with the updated information



# As a user
# When I visit the index page
# click on the edit button
# I should be redirected to edit page
# And fill in station name, city_id, installation_date, dock_count
# And click Update
# I should be redirected to the index page with the updated information
