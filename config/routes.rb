Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root as: "root_without_locale", to: "application#root_without_locale"

  scope ":locale", locale: /#{I18n.available_locales.map(&:to_s).join("|")}/ do
    root to: "pages#index"
    controller :pages do
      get "about-us", action: "about_us"
      get "faq", action: "faq"
      get "contact", action: "contact"
      get "terms-and-conditions", action: "terms_and_conditions", as: :terms_and_conditions
    end

    controller "forms" do
      post "contact-request", action: "contact_request"
    end
    scope "services", controller: "services" do
      root action: "index", as: :services
      get ":id", action: :show, as: :service
    end
  end


  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # mount Ckeditor::Engine => '/ckeditor'
  #devise_for :users


  match "*url", to: "application#render_not_found", via: [:get, :post, :path, :put, :update, :delete]
end