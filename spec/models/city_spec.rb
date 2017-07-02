RSpec.describe City do
  describe "Validations" do
    it "is invalid without a city name" do
      city = City.new(city: nil)

      expect(city).to_not be_valid
    end
  end
end
