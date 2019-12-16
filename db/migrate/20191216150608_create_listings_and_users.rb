class CreateListingsAndUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.timestamps
    end

    create_table :users do |t|
      t.string :name
      t.string :email
    end
  end
end
