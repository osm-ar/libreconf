class Sponsor < ActiveRecord::Base
  attr_accessible :description, :email, :name, :sponsor_type_id, :website, :logo_url

  belongs_to :sponsor_type
end
