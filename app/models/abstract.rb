class Abstract < ActiveRecord::Base
  attr_accessible :author, :description, :email, :abstract_status_id, :title, :organization, :is_key, :country
  belongs_to :abstract_status
  after_create :notify_created
  after_save :notify_approved

  private
    def notify_created
      ApplicationMailer.abstract_created_notification(self).deliver
    end
    
    def notify_approved
      ApplicationMailer.abstract_approved_notification(self).deliver if self.abstract_status_id_changed? and self.abstract_status_id == AbstractStatus::APPROVED
    end
end
