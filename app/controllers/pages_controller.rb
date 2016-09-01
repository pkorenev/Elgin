class PagesController < ApplicationController
  before_action :set_page_instance, except: [:index]
  before_action :initialize_locale_links, except: [:index]

  self.layout "home"

  def index
    set_page_metadata(:home)
    initialize_locale_links
    @services = Service.published.sort_by_sorting_position
    #@testimonials = Testimonial.published.sort_by_sorting_position

    @advantages = t("advantages-block.advantages")
    @contact_form = ContactRequest.new
  end

  def about_us

  end

  def faq

  end

  def contact

  end

  def terms_and_conditions
    @content = Pages.terms_and_conditions.content
  end

  private

  def set_page_instance
  #   set_page_metadata(action_name)
  end
end