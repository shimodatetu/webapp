class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :lang
      t.text :content_eng
      t.text :content_jap
      t.string :image
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
