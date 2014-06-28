class NotificationsMailer < ActionMailer::Base

  default :from => "cypher.ar@gmail.com"
  default :to => "sotm@openstreetmap.com.ar"

  def new_message(message)
    @message = message
    mail(:subject => "[SotM 2014] #{message.subject}")
  end

end