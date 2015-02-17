class AddUrlsToMakeupartist < ActiveRecord::Migration
  def change
    add_column :makeupartists, :facebook, :string
    add_column :makeupartists, :instagram, :string
  end
end
