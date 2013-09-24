class RemoveLocationFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :location
    remove_column :events, :street1
    remove_column :events, :street2
    remove_column :events, :city
    remove_column :events, :postalcode
    remove_column :events, :email
    remove_column :events, :phone
  end

  def down
    add_column :events, :location, :string
    add_column :events, :street1, :string
    add_column :events, :street2, :string
    add_column :events, :city, :string
    add_column :events, :postalcode, :string
    add_column :events, :email, :string
    add_column :events, :phone, :string
  end
end
