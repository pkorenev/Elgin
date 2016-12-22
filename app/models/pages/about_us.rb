module Pages
  class AboutUs < Cms::Page

    def url(locale = I18n.locale)
      "/#{locale}/about-us"
    end


  end
end