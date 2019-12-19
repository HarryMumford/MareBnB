class Listing < ActiveRecord::Base
  has_many(:requests)
end
