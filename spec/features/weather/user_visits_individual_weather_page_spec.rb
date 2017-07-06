RSpec.describe "User visits individual weather day" do

  it "sees individual weather day" do
    @weather_date = BikeDate.create(date: "2017-04-19")
    @weather_day = Condition.create(date_id: @weather_date.id, max_temp: 85, mean_temp: 83, min_temp: 81, mean_humidity: 77, mean_visibility: 7, mean_wind_speed: 12, precipitation: 1)

    visit "/conditions/#{@weather_day.id}"

    expect(current_path).to eq "/conditions/#{@weather_day.id}"
    expect(page).to have_content("#{@weather_date.id}")
    expect(page).to have_content("Max Temp")
    expect(page).to have_content("Min Temp")
    expect(page).to have_content("Mean Temp")
    expect(page).to have_content("Mean Humidity")
    expect(page).to have_content("Mean Visibility")
    expect(page).to have_content("Mean Wind Speed")
    expect(page).to have_content("Precipitation")
  end
end
