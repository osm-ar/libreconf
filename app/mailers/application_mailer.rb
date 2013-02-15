class ApplicationMailer < ActionMailer::Base
  default from: ENV["MAIL_FROM"]

  def abstract_notification(abstract)
    @abstract = abstract
    mail(:to => ENV["MAIL_TO"], :subject => "Nuevo resumen aprobado")
  end
end
