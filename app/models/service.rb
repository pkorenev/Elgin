class Service < ActiveRecord::Base
  attr_accessible :published

  globalize :name, :short_description, :url_fragment, :content

  image :banner, styles: {xxl: "2100x750#", thumb: "210x75#"}
  image :avatar, styles: { avatar: "400x400#", thumb: "100x100" }

  boolean_scope :published
  scope :sort_by_sorting_position, -> { order("sorting_position asc") }

  has_cache
  def cache_instances
    [Pages.home, Pages.services, Service.all, Pages.sitemap_xml]
  end

  has_seo_tags
  has_sitemap_record

  after_create :initialize_sorting_position

  def url(locale = I18n.locale)
    url_fragment = self.translations_by_locale[locale.to_sym].try(:url_fragment)
    "/#{locale}/services/#{url_fragment}"
  end
end
