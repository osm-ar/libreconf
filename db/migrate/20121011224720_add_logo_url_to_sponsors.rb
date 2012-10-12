class AddLogoUrlToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :logo_url, :string
  end
end
