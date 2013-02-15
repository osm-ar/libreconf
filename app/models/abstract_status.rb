class AbstractStatus < ActiveRecord::Base
  attr_accessible :name
  APPROVED = 3

  has_many :abstracts
end
