class AddCurrentLocationFormattedAddressToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :current_location_formatted_address, :string
  end
end
