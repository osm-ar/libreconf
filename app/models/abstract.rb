class Abstract < ActiveRecord::Base
  attr_accessible :author, :description, :email, :abstract_status_id, :title, :organization

  belongs_to :abstract_status
end
