RSpec.describe "User visits the weather index page and" do

  it "and clicks the delete button on a weather day" do
    @weather_date = BikeDate.find_or_create_by(date: "2017-04-19")
    @weather_day = Condition.create(date_id: @weather_date.id, max_temp: 85.0, mean_temp: 83.0, min_temp: 81.0, mean_humidity: 77.0, mean_visibility: 7.0, mean_wind_speed: 12.0, precipitation: 1.0)

    visit '/conditions'

    click_button("Delete")

    expect(current_path).to eq("/conditions")
    expect(page).to_not have_content("April 19, 2017")
  end
end
