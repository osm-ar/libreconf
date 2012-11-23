class Speaker < ActiveRecord::Base
  attr_accessible :description, :name, :picture_url, :title, :organization, :country, :locale
  translates :title, :description
  class Translation
    attr_accessible :locale
  end
end
