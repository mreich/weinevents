class AddSitecityIdToEvents < ActiveRecord::Migration
  def change
  	add_column "events", "sitecity_id", :integer
  end
end
