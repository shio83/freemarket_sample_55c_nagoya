class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :url, null:false, default: "0"
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
