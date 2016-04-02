class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.text :description
      t.references :user, null: false, index: true

      t.timestamps null: false
    end
  end
end
