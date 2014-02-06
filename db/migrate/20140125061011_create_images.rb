class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :filename
      t.references :story
      t.attachment :img

      t.timestamps
    end
    
    add_index :images, :story_id
  end
end
