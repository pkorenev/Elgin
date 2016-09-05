class Advantage < ActiveRecord::Base
  attr_accessible *attribute_names
  globalize :title, :subtitle, :description

  boolean_scope :published
  scope :sort_by_sorting_position, -> { order("sorting_position asc") }

  has_cache
  after_create :initialize_sorting_position
end
