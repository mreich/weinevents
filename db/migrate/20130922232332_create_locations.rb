class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.string :street1
      t.string :street2
      t.string :city
      t.string :postalcode
      t.string :email
      t.string :phone
      t.string :website
      t.integer :sitecity_id
      t.integer :user_id
      t.integer :state_id
      t.integer :country_id
      t.string :url

      t.timestamps
    end
    add_index :locations, :user_id
    add_index :locations, :url, :unique => true
  end
end
