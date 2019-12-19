class Request < ActiveRecord::Base
  belongs_to(:listing)
  
  def self.coinciding_requests(request)
    Request.all.select do |r|
      r.id != request.id && (
        request.start <= r.start && r.start <= request.end ||
        request.start <= r.end && r.end <= request.end ||
        request.start >= r.start && r.end >= request.end
      )
    end
  end
end
