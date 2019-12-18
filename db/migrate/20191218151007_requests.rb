class Requests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :listing_id
      t.integer :user_id
      t.date :start
      t.date :end
      t.boolean :accepted
      t.boolean :rejected
    end
  end
end
