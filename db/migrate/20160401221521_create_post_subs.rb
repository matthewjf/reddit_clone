class CreatePostSubs < ActiveRecord::Migration
  def change
    create_table :post_subs do |t|
      t.references :sub, null: false, index: true
      t.references :post, null: false, index: true

      t.timestamps null: false
    end
  end
end
