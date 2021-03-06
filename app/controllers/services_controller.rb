class ServicesController < ApplicationController
  before_action :initialize_service, only: [:show]
  caches_page :index, :show

  def index
    @services = Service.published.sort_by_sorting_position
    set_page_metadata(:services)
    initialize_locale_links
  end

  def show
    @another_header = true
    #@service = Service.first
    @banner = {}
    @banner[:image_url] = @service.banner.url(:xxl) if @service.banner.exists?
    @services = Service.published.sort_by_sorting_position

    @prev = @service.prev(@services)
    @next = @service.next(@services)
  end

  private
  def initialize_service
    @service = Service.published.joins(:translations).where(service_translations: { url_fragment: params[:id], locale: params[:locale] } ).first
    if @service.nil?
      return render_not_found
    end
    set_page_metadata(@service)
    initialize_locale_links
  end
end