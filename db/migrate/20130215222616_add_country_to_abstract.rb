class AddCountryToAbstract < ActiveRecord::Migration
  def change
    add_column :abstracts, :country, :string
  end
end
