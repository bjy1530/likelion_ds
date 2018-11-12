class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.references :post, show: true, foreign_key: true
      t.text :context
      t.string :nickname
      t.timestamps
    end
  end
end
