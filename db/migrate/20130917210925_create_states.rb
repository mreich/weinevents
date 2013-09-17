class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.string :description
      t.integer :country_id

      t.timestamps
    end
  end
end
