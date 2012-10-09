class Abstract < ActiveRecord::Base
  attr_accessible :author, :description, :email, :status_id, :title
end
