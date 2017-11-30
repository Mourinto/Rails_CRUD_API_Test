class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.string :street
      t.string :city
      t.integer :zip
      t.string :state
      t.integer :beds
      t.integer :baths
      t.integer :sq__ft
      t.string :type
      t.date :sale_date
      t.integer :price
      t.float :latitude
      t.float :longitude
    end
  end
end
