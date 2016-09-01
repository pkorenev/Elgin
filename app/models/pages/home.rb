module Pages
  class Home < Cms::Page
    has_html_block :name

    def url(locale = I18n.locale)
      "/#{locale}"
    end
  end
end