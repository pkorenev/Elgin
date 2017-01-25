module Cms
  class Text
    has_cache do
      pages :about_us, :contact, :home, :services, :terms_and_conditions
      pages Service.published
    end
  end
end