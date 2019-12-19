describe Request do
  let(:listing_id) { 1 }
  describe '.coinciding_request' do
    it 'should return an array of coinciding requests' do
      request_to_be_accepted = Request.create(
        listing_id: listing_id,
        user_id: 1,
        start: Date.parse("10/01/2021"),
        end: Date.parse("20/01/2021"),
        accepted: false,
        rejected: false
      )

      request_to_be_rejected_1 = Request.create(
        listing_id: listing_id,
        user_id: 2,
        start: Date.parse("11/01/2021"),
        end: Date.parse("19/01/2021"),
        accepted: false,
        rejected: false
      )

      request_to_be_rejected_2 = Request.create(
        listing_id: listing_id,
        user_id: 3,
        start: Date.parse("01/01/2021"),
        end: Date.parse("10/01/2021"),
        accepted: false,
        rejected: false
      )

      request_to_be_rejected_3 = Request.create(
        listing_id: listing_id,
        user_id: 4,
        start: Date.parse("20/01/2021"),
        end: Date.parse("30/01/2021"),
        accepted: false,
        rejected: false
      )

      request_to_be_rejected_4 = Request.create(
        listing_id: listing_id,
        user_id: 4,
        start: Date.parse("08/01/2021"),
        end: Date.parse("30/01/2021"),
        accepted: false,
        rejected: false
      )

      requests_to_be_rejected = Request.coinciding_requests(request_to_be_accepted)

      expect(requests_to_be_rejected).to_not include(request_to_be_accepted)

      expect(requests_to_be_rejected).to include(
        request_to_be_rejected_1, 
        request_to_be_rejected_2,
        request_to_be_rejected_3,
        request_to_be_rejected_4
      )
    end
  end
end
