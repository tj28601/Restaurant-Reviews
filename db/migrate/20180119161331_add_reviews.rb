class AddReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :restaurant, null: false
      t.integer :rating, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
