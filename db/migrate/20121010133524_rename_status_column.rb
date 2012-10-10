class RenameStatusColumn < ActiveRecord::Migration
  change_table :abstracts do |t|
    t.rename :status_id, :abstract_status_id
  end
end
