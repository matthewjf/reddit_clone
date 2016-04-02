class ChangeNullPostsSubs < ActiveRecord::Migration
  def change
    change_column :posts_subs, :post_id, :integer, null: false
    change_column :posts_subs, :sub_id, :integer, null: false
  end
end
