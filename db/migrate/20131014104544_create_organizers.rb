class CreateOrganizers < ActiveRecord::Migration
   def change
    create_table :organizers do |t|
      t.string :name
      t.text :description
      t.string :email
      t.string :phone
      t.string :website
      t.string :eventpage
      t.integer :sitecity_id
      t.integer :user_id
      t.string :url
      t.timestamps
    end
    add_index :organizers, :user_id
    add_index :organizers, :url, :unique => true
  end
end
