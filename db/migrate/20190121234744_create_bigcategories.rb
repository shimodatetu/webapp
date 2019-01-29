class CreateBigcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :bigcategories do |t|
      t.string :name_en
      t.string :name_jp
      t.timestamps
    end
  end
end
