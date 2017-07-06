RSpec.describe "User edits a weather day" do

  before :each do
    @weather_date = BikeDate.create(date: "2017-04-19")
    @weather_day = Condition.create!(date_id: @weather_date.id, max_temp: 85.0, mean_temp: 83.0, min_temp: 81.0, mean_humidity: 77.0, mean_visibility: 7.0, mean_wind_speed: 12.0, precipitation: 1.0)
    puts @weather_day.id
  end

  it "can update a weather day from /conditions" do
    visit "/conditions"

    click_link("Edit")

    expect(current_path).to eq("/conditions/#{@weather_day.id}/edit")

    fill_in "condition[date_id]", with: "2017-04-18"
    fill_in "condition[max_temp]", with: 75.0
    fill_in "condition[min_temp]", with: 71.0
    fill_in "condition[mean_temp]", with: 73.0
    fill_in "condition[mean_humidity]", with: 62.0
    fill_in "condition[mean_visibility]", with: 8.0
    fill_in "condition[mean_wind_speed]", with: 5.0
    fill_in "condition[precipitation]", with: 0.0

    click_button("Submit")

    expect(current_path).to eq("/conditions/#{@weather_day.id}")
    expect(page).to have_content("April 18, 2017")
  end

  it "can update a weather day from Edit URL" do
    visit '/conditions/#{@weather_day.id}/edit'

    fill_in "condition[date_id]", with: 1
    fill_in "condition[max_temp]", with: 75.0
    fill_in "condition[min_temp]", with: 71.0
    fill_in "condition[mean_temp]", with: 73.0
    fill_in "condition[mean_humidity]", with: 62.0
    fill_in "condition[mean_visibility]", with: 8.0
    fill_in "condition[mean_wind]", with: 5.0
    fill_in "condition[precipitation]", with: 0.0

    click_button("Submit")

    expect(current_path).to eq("/conditions/#{@weather_day.id}")
    expect(page).to have_content("April 18, 2017")
  end

end
