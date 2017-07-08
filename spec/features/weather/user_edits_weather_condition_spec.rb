RSpec.describe "User updates a weather condition" do

  before :each do
    @weather_date = BikeDate.create(date: "2017-04-19")
    @weather_day = Condition.create!(date_id: @weather_date.id, max_temp: 85.0, mean_temp: 83.0, min_temp: 81.0, mean_humidity: 77.0, mean_visibility: 7.0, mean_wind_speed: 12.0, precipitation: 1.0)
    puts @weather_day.id
  end

  it "from /conditions" do
    visit "/conditions"

    first(:link, "Edit Weather").click

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
    expect(page).to have_content("#{@weather_date.id}")
  end

  it "from /conditions/:id/edit" do

    visit "/conditions/#{@weather_day.id}/edit"

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
    expect(page).to have_content("#{@weather_date.id}")
  end

end
