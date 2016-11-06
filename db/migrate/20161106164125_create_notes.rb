class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :description
      t.integer :user_id
      t.integer :location_id

      t.timestamps

    end
  end
end
