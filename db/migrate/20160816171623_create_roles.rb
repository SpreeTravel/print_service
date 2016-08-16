class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.text :description
    end
    Role.create!(name: 'admin')
  end
end
