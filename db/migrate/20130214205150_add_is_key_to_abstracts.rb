class AddIsKeyToAbstracts < ActiveRecord::Migration
  def change
    add_column :abstracts, :is_key, :boolean, :default => false
  end
end
