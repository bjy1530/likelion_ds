class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.string :image
      t.string :name
      t.string :nickname

      t.timestamps
    end
  end
end
