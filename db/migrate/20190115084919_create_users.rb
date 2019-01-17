class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :country
      t.string :gender
      t.string :fullName
      t.string :age
      t.string :image
      t.string :profile
      t.string :password_digest

      t.timestamps
    end
  end
end
