class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.string :authorization_token, null: false, unique: true
      t.string :security_code,      null: false
      t.string :month,	            null: false
      t.string :year,               null: false
      t.references :user,		    null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
