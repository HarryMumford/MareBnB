describe Availability do

  let(:request_class) { double(:Request, update: request, coinciding_requests: [request, request, request]) }
  let(:listing_id) { 1 }

  before(:each) do
    Availability.create(start: "01/01/2021", end: "31/01/2021", listing_id: listing_id)
  end

  describe ".available?" do

    it "should return true if dates are available" do
      expect(Availability.available?(start_date: "02/01/2021",
                                     end_date: "05/01/2021",
                                     listing_id: listing_id))
        .to be true
    end

    it "should return false if dates are unavailable" do
      expect(Availability.available?(start_date: "02/02/2021",
                                     end_date: "05/02/2021",
                                     listing_id: listing_id))
        .to be false
    end

    it "should return true if dates are available" do
      expect(Availability.available?(start_date: "01/01/2021",
                                     end_date: "05/01/2021",
                                     listing_id: listing_id))
        .to be true
    end

    it "should return true if dates are available" do
      expect(Availability.available?(start_date: "01/01/2021",
                                     end_date: "31/01/2021",
                                     listing_id: listing_id))
        .to be true
    end

    it "should raise an error if the start is after the end date" do
      expect { Availability.available?(start_date: "05/01/2021",
                                     end_date: "03/01/2021",
                                     listing_id: listing_id) 
      }.to raise_error(AvailabilityError, "Cannot have start date after end date")
    end

    it "should raise an error if the start is the same as the end date" do
      expect { Availability.available?(start_date: "05/01/2021",
                                     end_date: "05/01/2021",
                                     listing_id: listing_id)
      }.to raise_error(AvailabilityError, "Must stay for at least one night")
    end
  end

  describe ".confirm_request" do
    let(:request) { double(:request,
                           start: Date.parse("03/01/2021"),
                           end: Date.parse("07/01/2021"),
                           id: 1,
                           listing_id: 1,
                           rejected: false)
    }

    it "should check availability of the request" do
      allow(request).to receive(:start).and_return(Date.parse("31/12/2020"))
      
      expect { Availability.confirm_request(request, request_class) }.to raise_error(AvailabilityError, "Cannot confirm unavailable request")
    end

    it "should confirm the request" do
      expect(request_class).to receive(:update).with(request.id, accepted: true)
        
      Availability.confirm_request(request, request_class)
    end

    it "should split the availability" do
      Availability.confirm_request(request, request_class)

      availabilities = Availability.all

      expect(availabilities[0].start).to eq(Date.parse("01/01/2021"))
      expect(availabilities[0].end).to eq(Date.parse("03/01/2021"))

      expect(availabilities[1].start).to eq(Date.parse("07/01/2021"))
      expect(availabilities[1].end).to eq(Date.parse("31/01/2021"))
    end

    it "should update the availability if the request is at the start" do
      allow(request).to receive(:start).and_return(Date.parse("01/01/2021"))

      Availability.confirm_request(request, request_class)

      availabilities = Availability.all

      expect(availabilities.length).to eq(1)
      expect(availabilities[0].start).to eq(Date.parse("07/01/2021"))
      expect(availabilities[0].end).to eq(Date.parse("31/01/2021"))
    end

    it "should update the availability if the request is at the end" do
      allow(request).to receive(:end).and_return(Date.parse("31/01/2021"))

      Availability.confirm_request(request, request_class)

      availabilities = Availability.all

      expect(availabilities.length).to eq(1)
      expect(availabilities[0].start).to eq(Date.parse("01/01/2021"))
      expect(availabilities[0].end).to eq(Date.parse("03/01/2021"))
    end

    it "should delete the availability if the request fills the available dates" do
      allow(request).to receive(:start).and_return(Date.parse("01/01/2021"))
      allow(request).to receive(:end).and_return(Date.parse("31/01/2021"))

      Availability.confirm_request(request, request_class)

      availabilities = Availability.all

      expect(availabilities.length).to eq(0)
    end

    it "should set coinciding requests to rejected" do
      expect(request_class).to receive(:coinciding_requests).with(request)
      # Request should receive update once to accept the request and then
      # three more times to reject coinciding requests
      expect(request_class).to receive(:update).exactly(4).times

      Availability.confirm_request(request, request_class)
    end

    it "should raise an error if the request has already been rejected" do
      allow(request).to receive(:rejected).and_return(true)
      
      expect { Availability.confirm_request(request, request_class) }.to raise_error(AvailabilityError, "Cannot confirm rejected request")
    end
  end
end
