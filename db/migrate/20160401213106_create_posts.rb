class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :sub, null: false, index: true
      t.string :title, null: false
      t.string :url
      t.text :content
      t.references :user, null: false, index: true

      t.timestamps null: false
    end
  end
end
