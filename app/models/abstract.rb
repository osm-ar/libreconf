class Abstract < ActiveRecord::Base
  attr_accessible :author, :description, :email, :abstract_status_id, :title, :organization, :is_key
  belongs_to :abstract_status
  after_save :send_notification

  private
    def send_notification
    	if self.abstract_status_id_changed? and self.abstract_status_id == AbstractStatus::APPROVED
        ApplicationMailer.abstract_notification(self).deliver
    end
  end
end
