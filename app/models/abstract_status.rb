class AbstractStatus < ActiveRecord::Base
  attr_accessible :name

  has_many :abstracts
end
