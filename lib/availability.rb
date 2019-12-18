class Availability < ActiveRecord::Base
  def self.available?(start_date:, end_date:, listing_id:)
    start_date = Date.parse(start_date)
    end_date = Date.parse(end_date)
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
end

class AvailabilityError < StandardError
end
