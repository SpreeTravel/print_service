class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :product
      t.text :description
      t.integer :amount
      t.integer :unit_price
      t.references :invoice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
