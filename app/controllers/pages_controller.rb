class PagesController < ApplicationController
  before_action :set_page_instance, except: [:index]
  before_action :initialize_locale_links, except: [:index]

  def index
    set_page_metadata(:home)
    initialize_locale_links
    @services = Service.published.sort_by_sorting_position
    #@testimonials = Testimonial.published.sort_by_sorting_position

    @advantages = Advantage.published.sort_by_sorting_position
    @contact_form = ContactRequest.new


  end

  def about_us
    @partners = Partner.published.sort_by_sorting_position
    @client_goals = ClientGoal.published.sort_by_sorting_position
  end

  def faq

  end

  def contact
    @contact_form = ContactRequest.new
  end

  def terms_and_conditions
    @content = Pages.terms_and_conditions.content
  end

  private

  def set_page_instance
     set_page_metadata(action_name)
  end
end