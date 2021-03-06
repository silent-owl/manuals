class ApplicationController < ActionController::Base
  before_action :set_locale

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, flash: {error: t('manuals_controller.flash.exeption_can_can')} 
  end

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to root_path, flash: {error: t('application_controller.flash.record_not_found')}
  end

  def redirect_if_not_signed_in
    redirect_to root_path if !user_signed_in?
  end

  def redirect_if_signed_in
    redirect_to root_path if user_signed_in?
  end
 
  private
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
