class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.boolean :display
      t.references :story
      t.references :artist
      t.attachment :img

      t.timestamps
    end
    
    add_index :images, :story_id
    add_index :images, :artist_id
  end
end
