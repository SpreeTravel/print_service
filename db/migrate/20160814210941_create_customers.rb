class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.references :organization, index: true, foreign_key: true


      t.timestamps
    end
  end
end
