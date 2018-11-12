class AddCategoryToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :category, :string
  end
end
