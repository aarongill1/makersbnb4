class CreateProperties < ActiveRecord::Migration[5.2]
  def change
  	create_table :properties do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string	:host_name
      t.integer :host_number
      t.integer :guests
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :beds
    end
  end
end
