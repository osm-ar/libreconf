class RemoveOrganizationFromWorkshop < ActiveRecord::Migration
  def up
    remove_column :workshops, :organization
  end

  def down
    add_column :workshops, :organization, :string
  end
end
