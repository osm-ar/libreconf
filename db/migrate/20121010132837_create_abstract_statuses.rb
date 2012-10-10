class CreateAbstractStatuses < ActiveRecord::Migration
  def change
    create_table :abstract_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
