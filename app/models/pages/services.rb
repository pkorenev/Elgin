module Pages
  class Services < Cms::Page
    def url(locale = I18n.locale)
      "/#{locale}/services"
    end
  end
end