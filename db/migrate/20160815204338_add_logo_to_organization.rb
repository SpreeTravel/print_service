class AddLogoToOrganization < ActiveRecord::Migration
  def change
    add_attachment :organizations, :logo

  end
end
