class AddOrganizationToAbstracts < ActiveRecord::Migration
  def change
    add_column :abstracts, :organization, :string
  end
end
