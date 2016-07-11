Rails.application.routes.draw do
  root to: "pages#main"

  controller :pages do
    get "about_us", action: "about_us"
    get "services", action: "services"
    get "service_one", action: "service_one"
    get "faq", action: "faq"
    get "contact", action: "contact"
    get "error404", action: "error404"
  end

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # mount Ckeditor::Engine => '/ckeditor'
  #devise_for :users


  match "*url", to: "application#render_not_found", via: [:get, :post, :path, :put, :update, :delete]
end