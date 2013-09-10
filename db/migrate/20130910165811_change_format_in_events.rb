class ChangeFormatInEvents < ActiveRecord::Migration
	def up
	    change_column :Events, :description, :text, :limit => nil
	end
	def down
	    # This might cause trouble if you have strings longer
	    # than 255 characters.
	    change_column :Events, :description, :string, :limit => 255
	end
end
