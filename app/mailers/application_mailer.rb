class ApplicationMailer < ActionMailer::Base
  default from: "geoinquietosbua@gmail.com"

  def abstract_notification(abstract)
    @abstract = abstract
    mail(:to => "info@foss4g.org.ar", :subject => "Nuevo resumen aprobado")
  end
end
