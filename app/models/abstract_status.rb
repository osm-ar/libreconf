class AbstractStatus < ActiveRecord::Base
  APPROVED = 3

  has_many :abstracts
end
