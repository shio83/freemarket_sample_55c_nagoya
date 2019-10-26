class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.text :text
      t.string :last_name,        null:false
      t.string :first_name,       null:false
      t.string :last_name_kana,   null:false
      t.string :first_name_kana,  null:false
      t.string :birth_year,       null:false
      t.string :birth_month,      null:false
      t.string :birth_day,        null:false
      t.references :user,         index:true, foreign_key: true
      t.timestamps
    end
  end
end
