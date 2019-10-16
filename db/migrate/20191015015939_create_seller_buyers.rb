class CreateSellerBuyers < ActiveRecord::Migration[5.0]
  def change
    create_table :seller_buyers do |t|
      t.references :buyer,             index:true,foreign_key: {to_table: :users},null:false
      t.references :seller,             index:true,foreign_key: {to_table: :users},null:false
      t.timestamps
    end
  end
end
