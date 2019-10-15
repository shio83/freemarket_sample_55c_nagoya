class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.text :text
      t.string :last_name,        null:false
      t.string :first_name,       null:false
      t.string :last_name_kana,   null:false
      t.string :first_name_kana,  null:false
      t.stirng :birth_year,       null:false
      t.string :birth_month,      null:false
      t.string :birth_day,        null:false
      t.string :zipcode,          null:false
      t.string :prefecture,       null:false 
      t.string :city,             null:false
      t.string :district,         null:false
      t.string :building,         null:false
      t.stirng :phone_number,     null:false, unique:true
      t.references :user,         index:true, foreign_key: true
      t.timestamps
    end
  end
end

