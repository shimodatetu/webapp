class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :birth_year
      t.integer :birth_month
      t.integer :birth_day
      t.string :name
      t.string :email
      t.string :country
      t.string :gender
      t.string :image
      t.string :profile_en
      t.string :profile_jp
      t.string :password_digest

      t.timestamps
    end
  end
end
