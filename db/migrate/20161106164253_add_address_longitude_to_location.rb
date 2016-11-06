class AddAddressLongitudeToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :address_longitude, :float
  end
end
