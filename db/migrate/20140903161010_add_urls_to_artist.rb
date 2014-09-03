class AddUrlsToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :facebook, :string
    add_column :artists, :instagram, :string
  end
end
