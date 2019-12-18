describe Availability do
  describe ".available?" do
    before(:each) do
      Availability.create(start: "01/01/2021", end: "31/01/2021", listing_id: 1)
    end

    it "should return true if dates are available" do
      expect(Availability.available?(start_date: "02/01/2021",
                                     end_date: "05/01/2021",
                                     listing_id: 1))
        .to be true
    end

    it "should return false if dates are unavailable" do
      expect(Availability.available?(start_date: "02/02/2021",
                                     end_date: "05/02/2021",
                                     listing_id: 1))
        .to be false
    end

    it "should return true if dates are available" do
      expect(Availability.available?(start_date: "01/01/2021",
                                     end_date: "05/01/2021",
                                     listing_id: 1))
        .to be true
    end

    it "should return true if dates are available" do
      expect(Availability.available?(start_date: "01/01/2021",
                                     end_date: "31/01/2021",
                                     listing_id: 1))
        .to be true
    end

    it "should raise an error if the start is after the end date" do
      expect { Availability.available?(start_date: "05/01/2021",
                                     end_date: "03/01/2021",
                                     listing_id: 1) 
      }.to raise_error(AvailabilityError, "Cannot have start date after end date")
    end

    it "should raise an error if the start is the same as the end date" do
      expect { Availability.available?(start_date: "05/01/2021",
                                     end_date: "05/01/2021",
                                     listing_id: 1)
      }.to raise_error(AvailabilityError, "Must stay for at least one night")
    end
  end
end
