class CreateNewsposts < ActiveRecord::Migration
  def change
    create_table :newsposts do |t|
      t.text :heading
      t.text :body
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
