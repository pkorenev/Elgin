def host?(*hosts)


  if hosts.blank? || !defined?(REQUEST_HOST)
    return true
  end

  hosts.include? REQUEST_HOST
end

module RailsAdminDynamicConfig
  class << self
    def configure_rails_admin(initial = true)
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



        if initial
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
            nestable do
              only [Service, Testimonial, Partner, ClientGoal]
            end

            ## With an audit adapter, you can add:
            # history_index
            # history_show
          end
        end

        ## Cms models
        config.include_models Cms::MetaTags, Cms::Page

        config.model_translation Cms::Page do

        end

        config.model Cms::MetaTags do
          visible false
          field :translations, :globalize_tabs
        end

        config.model_translation Cms::MetaTags do
          field :locale, :hidden
          field :title
          field :keywords
          field :description
        end

        config.include_models Cms::Text

        config.model Cms::Text do
          edit do
            field :key
            field :translations, :globalize_tabs
          end

          list do
            field :key
            field :translations do
              pretty_value do
                o = @bindings[:object]
                translation_locales = Hash[I18n.available_locales.map{|locale| [locale, (t = o.translations_by_locale[locale]) && t.content.present?] }]
                translation_locales.map{|locale, translated| color = translated ? 'green' : 'red'; "<span style='color: #{color}'>#{locale}</span>" }.join(", ").html_safe
                # o.translations_by_locale
                # if o.promotional_price?
                #   "<strike style='color: gray'>#{original_price}</strike><font color='orange' style='margin-left: 5px'>#{o.promotional_price}</font>".html_safe
                # else
                #   original_price
                # end
              end
            end
          end
        end

        config.model_translation Cms::Text do
          field :locale, :hidden
          field :content
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
          field :name
          field :short_description
          field :url_fragment
          field :content, :ck_editor
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

        config.include_models Partner, ClientGoal

        config.model Partner do
          nestable_list({position_field: :sorting_position})

          field :translations, :globalize_tabs
        end

        config.model_translation Partner do
          field :locale, :hidden
          field :name
          field :position
          field :description, :ck_editor
        end

        config.model ClientGoal do
          nestable_list({position_field: :sorting_position})

          field :icon
          field :translations, :globalize_tabs
        end

        config.model_translation ClientGoal do
          field :locale, :hidden
          field :name
          field :description
        end
      end
    end
  end
end