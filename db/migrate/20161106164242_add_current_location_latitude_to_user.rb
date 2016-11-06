class AddCurrentLocationLatitudeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :current_location_latitude, :float
  end
end
