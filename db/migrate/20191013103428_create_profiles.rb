class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :zipcode,          null:false
      t.string :prefecture,       null:false 
      t.string :city,             null:false
      t.string :address,         null:false
      t.string :building,         null:false
      t.references :user,         index:true, foreign_key: true
      t.timestamps
    end
  end
end

