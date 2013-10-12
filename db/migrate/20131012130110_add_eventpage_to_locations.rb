class AddEventpageToLocations < ActiveRecord::Migration
   def change
    add_column :locations, :eventpage, :string
  end
end
