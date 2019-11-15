class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :last_name,        null:false
      t.string :first_name,       null:false
      t.string :last_name_kana,   null:false
      t.string :first_name_kana,  null:false
      t.string :birth_year,       null:false
      t.string :birth_month,      null:false
      t.string :birth_day,        null:false
      t.references :user,         index:true, foreign_key: true
      t.string :phone_number,     null:false, unique: true
      t.string :zipcode,          null:false
      t.string :prefecture,       null:false 
      t.string :city,             null:false
      t.string :address,         null:false
      t.string :building,         null:false
      t.string :authorization_token, null: false, unique: true
      t.string :security_code,      null: false
      t.string :expiration_date_month,	            null: false
      t.string :expiration_date_year,               null: false
      t.timestamps
    end
  end
end
