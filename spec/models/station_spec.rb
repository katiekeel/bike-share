RSpec.describe Station do
  describe "Validations" do
    it "is invalid without a name" do
      station = Station.new(dock_count: 22, city_id: 3, installation_date: "11/11/11")

      expect(station).to_not be_valid
    end

    it "is invalid without a dock count" do
      station = Station.new(name: "sure", city_id: 1, installation_date: "11/11/11")

      expect(station).to_not be_valid
    end

    it "is invalid without a city" do
      station = Station.new(name: "sure", dock_count: 22, installation_date: "11/11/11")

      expect(station).to_not be_valid
    end

    it "is invalid without a installation_date" do
      station = Station.new(name: "sure", dock_count: 22, city_id: 1)

      expect(station).to_not be_valid
    end


    describe "Instance Methods" do
      it "shows all stations count numerically" do
        station = Station.create(name: "Turing",dock_count: 10, city_id: 1, installation_date: "12-12-12")
        station = Station.create(name: "SChool",dock_count: 12, city_id: 2, installation_date: "12-12-12")
        station = Station.create(name: "Of",dock_count: 3, city_id: 1, installation_date: "12-12-12")
        total = Station.total_stations

        expect(total).to eq(3)
      end

      it "shows average bikes per station" do
        station = Station.create(name: "Turing",dock_count: 10, city_id: 1, installation_date: "12-12-12")
        station = Station.create(name: "SChool",dock_count: 8, city_id: 2, installation_date: "12-12-12")
        station = Station.create(name: "Of",dock_count: 3, city_id: 1, installation_date: "12-12-12")
        average = Station.average_bikes_per_station

        expect(average).to eq(7)
      end

      it "shows average bikes per station in float" do
        station = Station.create(name: "Turing",dock_count: 10, city_id: 1, installation_date: "12-12-12")
        station = Station.create(name: "SChool",dock_count: 12, city_id: 2, installation_date: "12-12-12")
        station = Station.create(name: "Of",dock_count: 3, city_id: 1, installation_date: "12-12-12")
        station = Station.create(name: "Of",dock_count: 4, city_id: 1, installation_date: "12-12-12")
        average = Station.average_bikes_per_station

        expect(average).to eq(7.25)
      end

      it "shows most bikes available from all stations" do
        station = Station.create(name: "Turing",dock_count: 10, city_id: 1, installation_date: "12-12-12")
        station = Station.create(name: "SChool",dock_count: 12, city_id: 2, installation_date: "12-12-12")
        station = Station.create(name: "Of",dock_count: 3, city_id: 1, installation_date: "12-12-12")
        station = Station.create(name: "Of",dock_count: 4, city_id: 1, installation_date: "12-12-12")
        most = Station.most_available

        expect(most).to eq(12)
      end

      it "shows most bikes at station with multiple stations eq" do
        station = Station.create(name: "Turing",dock_count: 12, city_id: 1, installation_date: "12-12-12")
        station = Station.create(name: "SChool",dock_count: 12, city_id: 2, installation_date: "12-12-12")
        station = Station.create(name: "Of",dock_count: 3, city_id: 1, installation_date: "12-12-12")
        station = Station.create(name: "Of",dock_count: 4, city_id: 1, installation_date: "12-12-12")
        most = Station.stations_with_most_bikes_available
        length = most.length

        expect(length).to eq(2)
        expect(most[0].name).to eq("Turing")
        expect(most[1].name).to eq("SChool")
      end

      it "shows least bikes at station" do
        station = Station.create(name: "Turing",dock_count: 12, city_id: 1, installation_date: "12-12-12")
        station = Station.create(name: "SChool",dock_count: 12, city_id: 2, installation_date: "12-12-12")
        station = Station.create(name: "Of",dock_count: 3, city_id: 1, installation_date: "12-12-12")
        station = Station.create(name: "Of",dock_count: 4, city_id: 1, installation_date: "12-12-12")
        most = Station.least_available

        expect(most).to eq(3)
      end

      it "shows least bikes at station with multiple stations equal dock_counts" do
        station = Station.create(name: "Turing",dock_count: 12, city_id: 1, installation_date: "12-12-12")
        station = Station.create(name: "SChool",dock_count: 12, city_id: 2, installation_date: "12-12-12")
        station = Station.create(name: "Of",dock_count: 3, city_id: 1, installation_date: "12-12-12")
        station = Station.create(name: "Design",dock_count: 4, city_id: 1, installation_date: "12-12-12")
        station = Station.create(name: "Software",dock_count: 3, city_id: 1, installation_date: "12-12-12")
        most = Station.stations_with_least_bikes_available
        length = most.length

        expect(length).to eq(2)
        expect(most[0].name).to eq("Of")
        expect(most[1].name).to eq("Software")
      end

      it "shows the station that was most recently installed" do
        station = Station.create(name: "Turing",dock_count: 12, city_id: 1, installation_date: "2017-7-02")
        station = Station.create(name: "SChool",dock_count: 12, city_id: 2, installation_date: "2012-1-11")
        recent = Station.most_recent_install.to_s

        expect(recent).to eq("2017-07-02")
      end

      it "shows the station object that was most recently installed" do
        station = Station.create(name: "Turing",dock_count: 12, city_id: 1, installation_date: "2017-7-02")
        station = Station.create(name: "SChool",dock_count: 12, city_id: 2, installation_date: "2012-1-11")
        recent = Station.most_recent_install_station

        expect(recent[0].name).to eq("Turing")
      end

      it "shows the station object that was most recently installed multiple" do
        station = Station.create(name: "Turing",dock_count: 12, city_id: 1, installation_date: "2017-7-02")
        station = Station.create(name: "SChool",dock_count: 12, city_id: 2, installation_date: "2012-1-11")
        station = Station.create(name: "OF",dock_count: 12, city_id: 1, installation_date: "2017-7-02")
        recent = Station.most_recent_install_station

        expect(recent[0].name).to eq("Turing")
        expect(recent[1].name).to eq("OF")
      end

      it "shows the station that was oldest installed station" do
        station = Station.create(name: "Turing",dock_count: 12, city_id: 1, installation_date: "2017-7-02")
        station = Station.create(name: "SChool",dock_count: 12, city_id: 2, installation_date: "2012-1-11")
        recent = Station.oldest_install.to_s

        expect(recent).to eq("2012-01-11")
      end

      it "shows the station object that was installed the longest ago" do
        station = Station.create(name: "Turing",dock_count: 12, city_id: 1, installation_date: "2017-7-02")
        station = Station.create(name: "SChool",dock_count: 12, city_id: 2, installation_date: "2012-1-11")
        recent = Station.oldest_installed_station

        expect(recent[0].name).to eq("SChool")
      end

      it "shows the station object that was oldest installed -- multiple stations" do
        station = Station.create(name: "Turing",dock_count: 12, city_id: 1, installation_date: "2017-7-02")
        station = Station.create(name: "SChool",dock_count: 12, city_id: 2, installation_date: "2012-1-11")
        station = Station.create(name: "OF",dock_count: 12, city_id: 1, installation_date: "2017-7-02")
        station = Station.create(name: "Software",dock_count: 12, city_id: 1, installation_date: "2012-1-11")
        recent = Station.oldest_installed_station

        expect(recent[0].name).to eq("SChool")
        expect(recent[1].name).to eq("Software")
      end
    end
  end
end
