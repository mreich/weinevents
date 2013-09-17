class AddCountryIdToSitecities < ActiveRecord::Migration
  def change
  	add_column "sitecities", "country_id", :integer
  end
end
