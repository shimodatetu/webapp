class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :title_base
      t.string :title_en
      t.string :title_jp
      t.integer :user_id
      t.integer :smallcategory_id

      t.timestamps
    end
  end
end
