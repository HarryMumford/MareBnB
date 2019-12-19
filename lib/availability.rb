class Availability < ActiveRecord::Base
  def self.available?(start_date:, end_date:, listing_id:)
    start_date = check_date_class(start_date)
    end_date = check_date_class(end_date)
    raise AvailabilityError.new("Cannot have start date after end date") if start_date > end_date
    raise AvailabilityError.new("Must stay for at least one night") if start_date == end_date

    availabilities = Availability.select_by_listing(listing_id)
    availabilities.any? do |avail|
      avail.start <= start_date && avail.end >= end_date
    end
  end

  def self.select_by_listing(id)
    Availability.all.select { |avail| avail.listing_id == id }
  end

  def self.confirm_request(request, request_class = Request)
    raise AvailabilityError.new("Cannot confirm rejected request") if request.rejected

    unless available?(start_date: request.start,
                      end_date: request.end,
                      listing_id: request.listing_id)
      raise AvailabilityError.new("Cannot confirm unavailable request")
    end

    request_class.update(request.id, accepted: true)

    fix_availability(request)

    requests = request_class.coinciding_requests(request)
    requests.each { |req| request_class.update(req.id, rejected: true) }
  end

  def self.find_availability_for_request(request)
    Availability.all.select do |avail|
      avail.listing_id == request.listing_id &&
      avail.start <= request.start &&
      avail.end >= request.end
    end.first
  end

  class << self

    private

    def fix_availability(request)
      availability = find_availability_for_request(request)

      if availability.start == request.start && availability.end == request.end
        Availability.delete(availability.id)
      elsif availability.start == request.start
        Availability.update(availability.id, start: request.end)
      elsif availability.end == request.end
        Availability.update(availability.id, end: request.start)
      else
        Availability.update(availability.id, end: request.start)
        Availability.create(start: request.end,
                            end: availability.end,
                            listing_id: request.listing_id)
      end
    end

    def check_date_class(date)
      date.class == String ? Date.parse(date) : date
    end
  end
end

class AvailabilityError < StandardError
end
