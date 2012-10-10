class Sponsor < ActiveRecord::Base
  attr_accessible :description, :email, :name, :sponsor_type_id, :website
end
