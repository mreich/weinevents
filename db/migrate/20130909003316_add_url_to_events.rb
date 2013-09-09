class AddUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :url, :string
    add_index :events, :url, :unique => true
    #Event.initialize_urls
  end
end
