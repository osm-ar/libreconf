class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :title
      t.string :author
      t.string :organization
      t.text :description
      t.integer :capacity

      t.timestamps
    end
  end
end
