class Speaker < ActiveRecord::Base
  attr_accessible :description, :name, :picture_url, :title
end
