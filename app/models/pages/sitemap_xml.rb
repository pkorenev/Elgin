module Pages
  class SitemapXml < Cms::Page
    attr_accessible *attribute_names

    def self.disabled?
      true
    end

    def url(*args)
      "/sitemap.xml"
    end
  end
end