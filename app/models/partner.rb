class Partner < ActiveRecord::Base
  attr_accessible *attribute_names
  globalize :name, :position, :description
  boolean_scope :published
  scope :sort_by_sorting_position, -> { order("sorting_position asc") }

  has_cache do
    pages :about_us
  end
  after_create :initialize_sorting_position
end
