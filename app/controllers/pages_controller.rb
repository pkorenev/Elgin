class PagesController < ApplicationController
  before_action :set_page_instance, except: [:index]

  self.layout "home"

  def index
  #   set_page_metadata(:home)
  end

  def about_us

  end

  def services

  end

  def service_one
    @another_header = true
  end

  def faq

  end

  def contact

  end

  def error404
    @render_header = false
    @render_footer = false

  end

  private

  def set_page_instance
  #   set_page_metadata(action_name)
  end
end