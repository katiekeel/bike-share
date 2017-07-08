RSpec.describe "User creates a new trip" do

  before :each do
    @city = City.create(city: "San Jose")
    @station = Station.create(name: "Adobe on Almaden", dock_count: 1, city_id: @city.id, installation_date: "2017-08-13")
    @date = BikeDate.bike_date_create("8/29/2013 14:14")
    @bike = Bike.create(bike: 520)
    @subscription = Subscription.create(subscription_type: "Subscriber")
    @zip_code = ZipCode.create(zip_code: 94217)
  end

  it "with valid inputs" do
     visit '/trips/new'

     fill_in('trip[duration]', :with => 45)
     fill_in('trip[start_date]', :with => "2007-08-30T14:14")
     select "Adobe on Almaden", :from => "trip[start_station]"
     fill_in('trip[end_date]', :with => "2007-08-30T14:59")
     select "Adobe on Almaden", :from => "trip[end_station]"
     select "520", :from => "trip[bike_id]"
     select "Subscriber", :from => "trip[subscription_type]"
     select "94217", :from => "trip[zip_code]"

     click_button("Create New Trip")

     trip = Trip.last

     expect(current_path).to eq("/trips/#{trip.id}")
     expect(page).to have_content("#{trip.id}")
  end

  it "with invalid inputs" do
    visit '/trips/new'

    fill_in('trip[start_date]', :with => "2007-08-30T14:14")
    select "Adobe on Almaden", :from => "trip[start_station]"
    fill_in('trip[end_date]', :with => "2007-08-30T14:59")
    select "Adobe on Almaden", :from => "trip[end_station]"
    select "520", :from => "trip[bike_id]"
    select "Subscriber", :from => "trip[subscription_type]"
    select "94217", :from => "trip[zip_code]"

    click_button("Create New Trip")

    trip = Trip.last

    expect(current_path).to eq("/trips")
    expect(page).to have_content("ERROR")
  end



end
