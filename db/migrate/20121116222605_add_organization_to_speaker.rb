class AddOrganizationToSpeaker < ActiveRecord::Migration
  def change
    add_column :speakers, :organization, :string
  end
end
