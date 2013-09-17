class AddStateIdToSitecities < ActiveRecord::Migration
  def change
  	add_column "sitecities", "state_id", :integer
  end
end
