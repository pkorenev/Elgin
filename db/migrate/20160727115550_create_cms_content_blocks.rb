class CreateCmsContentBlocks < ActiveRecord::Migration
  def up
    Cms.create_html_blocks_table
  end

  def down
    Cms.drop_html_blocks_table
  end
end
