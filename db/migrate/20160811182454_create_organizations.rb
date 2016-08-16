class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :website
      t.string :country
      t.string :currency
      t.string :time_zone

      t.timestamps
    end
  end
end
