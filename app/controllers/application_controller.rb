class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  def set_locale
    I18n.locale = get_from_header || get_from_qs || get_from_host || I18n.default_locale
    @other_locale = I18n.locale == :es ? :en : :es
  end

  def get_from_host
    parsed_locale = request.host.include?('ar') ? :es : :en
    I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale  : nil
  end

  def get_from_header
    parsed_locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first.include?('es') ? :es : :en
    I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale  : nil
  end

  def get_from_qs
    parsed_locale = request.query_string.include?('l=es') ? :es : :en
    I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale  : nil
  end
end
