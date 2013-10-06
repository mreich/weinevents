class AddLatitudeAndLongitudeToSitecity < ActiveRecord::Migration
  def change
    add_column :sitecities, :latitude, :float
    add_column :sitecities, :longitude, :float
  end
end
