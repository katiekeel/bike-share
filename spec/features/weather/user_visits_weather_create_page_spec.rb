RSpec.describe "User creates a new weather day and" do

  it "sees a form with date, max temp, mean temp, min temp, mean humidity, mean visibility, mean wind speed, and precipitation" do
    visit '/conditions/new'

    expect(page).to have_content("Date")
    expect(page).to have_content("Max Temp")
    expect(page).to have_content("Min Temp")
    expect(page).to have_content("Mean Temp")
    expect(page).to have_content("Mean Humidity")
    expect(page).to have_content("Mean Visibility")
    expect(page).to have_content("Mean Wind Speed")
    expect(page).to have_content("Precipitation")
  end

  it "doesn't fill in all fields and gets an error message" do
    visit '/conditions/new'
    fill_in "condition[date_id]", with: "2018-04-19"
    fill_in "condition[max_temp]", with: 75.0
    fill_in "condition[min_temp]", with: 71.0

    find_button("Create New Weather Condition").click

    expect(page).to have_content("ERROR")
  end
end
