class AddAddressLatitudeToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :address_latitude, :float
  end
end
