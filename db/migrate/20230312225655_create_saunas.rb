class CreateSaunas < ActiveRecord::Migration[6.1]
  def change
    create_table :saunas do |t|

      t.integer :genre_id, null: false
      t.integer :area_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.string :business_hours
      t.boolean :is_active, null: false, default: false
      t.timestamps
    end
  end
end
