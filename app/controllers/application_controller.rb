class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ActionView::Helpers::OutputSafetyHelper
  include ActionView::Helpers::AssetUrlHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper
  include Cms::Helpers::PagesHelper
  include Cms::Helpers::MetaDataHelper
  include Cms::Helpers::NavigationHelper
  include Cms::Helpers::ActionView::UrlHelper
  include Cms::Helpers::FormsHelper
  include Cms::Helpers::TranslationHelper
  include ApplicationHelper
  include Cms::Helpers::ImageHelper

  before_action :set_locale, unless: :admin_panel?

  reload_text_translations

  reload_rails_admin_config



  def render_not_found
    @render_header = false
    @render_footer = false
    render template: "errors/not_found.html.slim", status: 404
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def root_without_locale
    redirect_to root_path(locale: I18n.locale)
  end

  def set_locale
    I18n.locale = params[:locale]
  end


  def admin_panel?
    admin = params[:controller].to_s.starts_with?("rails_admin")

    return admin
  end

  def initialize_locale_links
    locale_links = {}
    Cms.config.provided_locales.each do |locale|
      #url = @page_instance.try{|p| v = p.url(locale); v = p.try(:default_url) if v.blank?; if !v.start_with?("/") then v = "/#{v}" end;   ("/#{locale}/#{v}" ) }
      url = @page_instance.try{ |p| v = p.url(locale); v = p.try(:default_url, locale) if v.blank?; if !v.start_with?("/") then v = "/#{v}" end;  v }

      locale_links[locale.to_sym] = url
    end

    @_locale_links = locale_links
  end


end
