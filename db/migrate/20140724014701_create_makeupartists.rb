class CreateMakeupartists < ActiveRecord::Migration
  def change
    create_table :makeupartists do |t|
      t.string :name
      t.string :picture
      t.text :bio
      t.attachment :avatar

      t.timestamps
    end
  end
end
