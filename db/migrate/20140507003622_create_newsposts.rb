class CreateNewsposts < ActiveRecord::Migration
  def change
    create_table :newsposts do |t|
      t.text :heading
      t.text :body
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
