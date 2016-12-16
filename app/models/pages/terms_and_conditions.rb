module Pages
  class TermsAndConditions < Cms::Page
    def url(locale = I18n.locale)
      translation_url = self.translations_by_locale[locale].url
      if translation_url.blank?
        return nil
      end
      if !translation_url.start_with?("/")
        translation_url = "/#{translation_url}"
      end
      "/#{locale}#{translation_url}"
    end
  end
end