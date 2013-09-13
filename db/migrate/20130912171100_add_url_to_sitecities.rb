class AddUrlToSitecities < ActiveRecord::Migration
  def change
    add_column :sitecities, :url, :string
    add_index :sitecities, :url, :unique => true
    #Sitecity.initialize_urls
  end
end
