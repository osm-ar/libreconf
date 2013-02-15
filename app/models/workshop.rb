class Workshop < ActiveRecord::Base
  attr_accessible :author, :capacity, :description, :organization, :title
end
