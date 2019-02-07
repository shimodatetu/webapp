class CreateSecretcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :secretcategories do |t|
      t.string :name_en
      t.string :name_jp
      t.integer :smallcategory_id
      t.timestamps
    end
  end
end
