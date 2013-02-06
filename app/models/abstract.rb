class Abstract < ActiveRecord::Base
  attr_accessible :author, :description, :email, :abstract_status_id, :title, :organization
  belongs_to :abstract_status
  before_create :set_status
  after_save :send_notification

  private
    def set_status
      self.abstract_status = AbstractStatus.find(1)
    end

    def send_notification
    	if self.abstract_status_id_changed? and self.abstract_status_id == 3
        ApplicationMailer.abstract_notification(self).deliver
    end
  end
end
