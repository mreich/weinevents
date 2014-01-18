class AddExternalLocationIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :external_location_id, :integer
    add_index :events, :external_location_id
  end
end
