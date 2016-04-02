class CreateJoinTablePostSub < ActiveRecord::Migration
  def change
    create_join_table :posts, :subs, column_options: { null: true } do |t|
    end
  end
end
