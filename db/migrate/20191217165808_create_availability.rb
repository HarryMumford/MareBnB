class CreateAvailability < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.date :start
      t.date :end
      t.integer :listing_id
    end
  end
end
