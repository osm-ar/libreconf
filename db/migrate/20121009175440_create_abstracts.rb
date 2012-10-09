class CreateAbstracts < ActiveRecord::Migration
  def change
    create_table :abstracts do |t|
      t.string :author
      t.string :email
      t.string :title
      t.text :description
      t.integer :status_id

      t.timestamps
    end
  end
end
