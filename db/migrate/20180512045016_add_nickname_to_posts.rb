class AddNicknameToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :user_nickname, :string
  end
end
