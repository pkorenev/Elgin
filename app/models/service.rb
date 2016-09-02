class Service < ActiveRecord::Base
  attr_accessible :published

  globalize :name, :short_description, :url_fragment, :content

  image :banner, styles: {xxl: "2100x750#", thumb: "210x75#"}
  image :avatar, styles: { avatar: "400x400#", thumb: "100x100" }

  boolean_scope :published
  scope :sort_by_sorting_position, -> { order("sorting_position asc") }

  has_cache
  has_seo_tags

  after_create :initialize_sorting_position
end
