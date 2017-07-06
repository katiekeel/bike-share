RSpec.describe "User visits weather index page and" do

  before :each do
    @weather_date = BikeDate.create(date: "2017-04-19 14:14")
    @weather_day = Condition.create(date_id: @weather_date.id, max_temp: 85.0, mean_temp: 83.0, min_temp: 81.0, mean_humidity: 77.0, mean_visibility: 7.0, mean_wind_speed: 12.0, precipitation: 1.0)
  end


  it "sees the weather days in the database" do
    visit '/conditions'

    expect(page).to have_content "ID"
    expect(page).to have_content "1"
  end

  it "takes you to the individual weather day view when you click edit" do
    visit '/conditions'

    click_link("Edit")

    expect(current_path). to eq ("/conditions/#{@weather_day.id}/edit")
    expect(page).to have_content("Edit")
  end

  it "sees a delete button for each weather day" do
    visit '/conditions'

    expect(page).to have_button("Delete")
  end

  it "takes you back to the weather index page when you click delete" do
    visit '/conditions'

    click_button('Delete')

    expect(current_path).to eq "/conditions"
    expect(page).to_not have_content("April 29, 2017")
  end

end
