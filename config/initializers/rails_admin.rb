RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
    nestable do
      only [Service, Testimonial]
    end
  end

  config.include_models User, Service, Testimonial
  config.include_models Pages::Home, Pages::Contact, Pages::AboutUs, Pages::Services, Pages::TermsAndConditions

  config.model Pages::Home do
    field :seo_tags
    #field :sitemap_record
  end

  config.model Pages::AboutUs do
    field :seo_tags
  end

  config.model Pages::TermsAndConditions do
    field :translations, :globalize_tabs
    field :seo_tags
    #field :sitemap_record
  end

  config.model_translation Pages::TermsAndConditions do
    field :locale, :hidden
    field :content, :ck_editor
  end

  config.model Service do
    nestable_list({position_field: :sorting_position})

    field :published
    field :translations, :globalize_tabs
    field :avatar
    field :banner
    field :seo_tags
  end

  config.model_translation Service do
    field :locale, :hidden
    fields :name, :short_description, :url_fragment, :content
  end

  config.model Testimonial do
    nestable_list({position_field: :sorting_position})

    field :published
    field :translations, :globalize_tabs
    field :avatar
  end

  config.model_translation Testimonial do
    field :locale, :hidden
    fields :name, :position, :content
  end
end
