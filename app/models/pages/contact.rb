module Pages
  class Contact < Cms::Page
    def url(locale = I18n.locale)
      "/#{locale}/contact"
    end
  end
end