class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :lang
      t.text :content_eng
      t.text :content_jap
      t.string :image
      t.integer :user_id
      t.integer :group_id
      t.binary :photo, :limit => 1.megabyte
      t.string :file_name

      t.timestamps
    end
  end
end
