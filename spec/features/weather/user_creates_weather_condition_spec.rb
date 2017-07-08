RSpec.describe "User creates a new weather condition" do

  before :each do
    @date = BikeDate.bike_date_create("8/29/2013 14:14")
  end

  it "with valid inputs" do
    visit '/conditions/new'

    fill_in "condition[date_id]", with: "2018-04-19"
    fill_in "condition[max_temp]", with: 1
    fill_in "condition[min_temp]", with: 1
    fill_in "condition[mean_temp]", with: 1
    fill_in "condition[mean_humidity]", with: 1
    fill_in "condition[mean_visibility]", with: 1
    fill_in "condition[mean_wind_speed]", with: 1
    fill_in "condition[precipitation]", with: 1

    click_button("Create New Weather Condition")

    condition = Condition.last

    expect(current_path).to eq("/conditions/#{condition.id}")
    expect(page).to have_content("#{condition.max_temp}")
  end


  it "with invalid inputs" do
    visit '/conditions/new'

    fill_in "condition[date_id]", with: "2018-04-19"
    fill_in "condition[max_temp]", with: 1
    fill_in "condition[mean_temp]", with: 1
    fill_in "condition[mean_humidity]", with: 1
    fill_in "condition[mean_visibility]", with: 1
    fill_in "condition[mean_wind_speed]", with: 1
    fill_in "condition[precipitation]", with: 1

    click_button("Create New Weather Condition")

    expect(current_path).to eq("/conditions")
    expect(page).to have_content("ERROR")
  end
end
