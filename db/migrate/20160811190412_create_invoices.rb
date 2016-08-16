class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :customer
      t.string :number
      t.string :order_number
      t.date :invoice_date
      t.string :salesperson
      t.string :terms
      t.date :due_date
      t.integer :total
      t.references :organization, index: true, foreign_key: true

      t.timestamps
    end
  end
end
