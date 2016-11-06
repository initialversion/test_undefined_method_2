class AddAddressFormattedAddressToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :address_formatted_address, :string
  end
end
