class CreateMakeupimages < ActiveRecord::Migration
  def change
    create_table :makeupimages do |t|
      t.references :makeupartist
      t.attachment :img

      t.timestamps
    end

        add_index :makeupimages, :makeupartist_id
  end
end
