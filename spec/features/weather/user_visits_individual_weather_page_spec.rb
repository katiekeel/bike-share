RSpec.describe "User visits individual weather day" do

  before :each do
    @weather_date = BikeDate.create(date: "2017-04-19")
    @weather_day = Condition.create(date_id: @weather_date.id, max_temp: 85, mean_temp: 83, min_temp: 81, mean_humidity: 77, mean_visibility: 7, mean_wind_speed: 12, precipitation: 1)
  end

  it "from /conditions/:id" do

    visit "/conditions/#{@weather_day.id}"

    expect(current_path).to eq "/conditions/#{@weather_day.id}"
    expect(page).to have_content("#{@weather_day.id}")
    expect(page).to have_content("#{@weather_day.max_temp}")
    expect(page).to have_content("#{@weather_day.min_temp}")
  end

  it "clicks edit link" do
    visit "/conditions/#{@weather_day.id}"

    click_link("Edit")

    expect(current_path).to eq("/conditions/#{@weather_day.id}/edit")
    expect(page).to have_content("Edit A Weather Condition")
  end

  it "clicks delete button" do
    visit "/conditions/#{@weather_day.id}"

    click_button("Delete")

    expect(current_path).to eq("/conditions")
    expect(page).to_not have_content("#{@weather_day.id}")
  end

end
