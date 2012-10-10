class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.text :description
      t.integer :sponsor_type_id
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
