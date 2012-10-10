class SponsorType < ActiveRecord::Base
  attr_accessible :name

  has_many :sponsors
end
