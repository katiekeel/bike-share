RSpec.describe "User visits weather index page and" do

  before :each do
    @weather_date = BikeDate.create(date: "2017-12-19 14:14")
    @weather_day = Condition.create(date_id: @weather_date.id, max_temp: 85.0, mean_temp: 83.0, min_temp: 81.0, mean_humidity: 77.0, mean_visibility: 7.0, mean_wind_speed: 12.0, precipitation: 1.0)
  end


  it "clicks the link to an individual day" do
    visit '/conditions'

    click_link("Dec 19, 2017")

    expect(current_path).to eq("/conditions/#{@weather_day.id}")
    expect(page).to have_content("December 19, 2017")
    expect(page).to have_content("#{@weather_day.id}")
  end

  it "clicks the edit button" do
    visit '/conditions'

    click_link("Edit")

    expect(current_path). to eq ("/conditions/#{@weather_day.id}/edit")
    expect(page).to have_content("Edit")
  end

  it "clicks the delete button" do
    visit '/conditions'

    click_button('Delete')

    expect(current_path).to eq "/conditions"
    expect(page).to_not have_content("December 19, 2017")
  end

end
