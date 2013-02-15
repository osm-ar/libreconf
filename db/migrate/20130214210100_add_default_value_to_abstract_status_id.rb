class AddDefaultValueToAbstractStatusId < ActiveRecord::Migration
  def up
    change_column :abstracts, :abstract_status_id, :integer, :default => 1
end

def down
    change_column :abstracts, :abstract_status_id, :integer, :default => nil
end
end
