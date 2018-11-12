class AddImagesToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :image2, :string
    add_column :reviews, :image3, :string
    add_column :reviews, :image4, :string
  end
end
