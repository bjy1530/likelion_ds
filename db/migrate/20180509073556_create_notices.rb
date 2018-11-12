class CreateNotices < ActiveRecord::Migration[5.0]
  def change
    create_table :notices do |t|
      t.string :title
      t.string :content
      t.datetime :deadline

      t.timestamps
    end
  end
end
