class ApplicationMailer < ActionMailer::Base
  default from: ENV["MAIL_FROM"]

  def abstract_created_notification(abstract)
    @abstract = abstract
    mail(:to => ENV["MAIL_TO"], :subject => "Han cargado un nuevo resumen")
  end

  def abstract_approved_notification(abstract)
    @abstract = abstract
    mail(:to => ENV["MAIL_TO"], :subject => "Nuevo resumen aprobado")
  end
end
