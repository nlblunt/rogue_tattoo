class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.date :date
      t.boolean :featured
      t.references :artist
      t.references :client
      
      t.timestamps
    end
    
    add_index :stories, :artist_id
    add_index :stories, :client_id
  end
end
