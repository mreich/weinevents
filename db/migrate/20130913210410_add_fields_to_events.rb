class AddFieldsToEvents < ActiveRecord::Migration
  def change
		add_column "events", "startdatetime", :datetime
		add_column "events", "enddatetime", :datetime
		add_column "events", "location", :string
		add_column "events", "street1", :string
		add_column "events", "street2", :string
		add_column "events", "city", :string
		add_column "events", "postalcode", :string
		add_column "events", "email", :string
		add_column "events", "phone", :string
  end
end
