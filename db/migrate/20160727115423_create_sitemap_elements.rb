class CreateSitemapElements < ActiveRecord::Migration
  def up
    Cms.create_sitemap_elements_table
  end

  def down
    Cms.drop_sitemap_elements_table
  end
end
