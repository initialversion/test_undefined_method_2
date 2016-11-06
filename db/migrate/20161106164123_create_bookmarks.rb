class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :location_id
      t.integer :user_id
      t.boolean :dogear

      t.timestamps

    end
  end
end
