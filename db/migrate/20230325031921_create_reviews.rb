class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :user_id, null: false
      t.integer :sauna_id, null: false
      t.string :review_title, null: false
      t.text :review_detail
      t.integer :graded_evaluation, null: false
      t.date :visit_date, null: false
      t.timestamps
    end
  end
end
