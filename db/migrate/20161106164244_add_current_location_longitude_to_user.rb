class AddCurrentLocationLongitudeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :current_location_longitude, :float
  end
end
