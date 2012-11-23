class AddCountryToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :country, :string
  end
end
