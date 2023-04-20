class CreateSaunas < ActiveRecord::Migration[6.1]
  def change
    create_table :saunas do |t|

      t.integer :genre_id, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address1, null: false
      t.string :address2, null: false
      t.string :address3, null: false
      t.float :latitude
      t.float :longitude
      t.text :introduction
      t.integer :price, null: false
      t.string :business_hours
      t.boolean :sales_state, null: false, default: false
      t.boolean :is_active, null: false, default: false
      t.timestamps
    end
  end
end
