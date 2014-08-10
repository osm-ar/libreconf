class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  def set_locale
    I18n.locale = get_from_qs || I18n.default_locale
    @other_locale = I18n.locale == :es ? :en : :es
    cookies[:locale] = { :value => I18n.locale, :expires => Time.now + 3600000}
  end


  def get_from_qs
    if request.query_string.include?('l=')
      parsed_locale = request.query_string.include?('l=es') ? :es : :en
      I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale  : nil
    end
  end
end
