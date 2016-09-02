class Testimonial < ActiveRecord::Base
  attr_accessible :published

  globalize :name, :position, :content

  image :avatar, styles: { avatar: "500x500#", thumb: "100x100" }

  boolean_scope :published
  scope :sort_by_sorting_position, -> { order("sorting_position asc") }

  has_cache

  after_create :initialize_sorting_position
end
