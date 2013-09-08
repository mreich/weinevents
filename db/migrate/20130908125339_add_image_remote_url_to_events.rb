class AddImageRemoteUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :image_remote_url, :string
  end
end
