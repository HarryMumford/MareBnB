class Request < ActiveRecord::Base
  belongs_to(:listing)
  
  def self.coinciding_requests(request)
    Request.all.select do |r|
      r.id != request.id && r.listing_id == request.listing_id && (
        date_within_request(r.start, request) ||
        date_within_request(r.end, request) ||
        request.start >= r.start && r.end >= request.end
      )
    end
  end

  class << self
    private
    def date_within_request(date, request)
      date >= request.start && date <= request.end
    end
  end
end
