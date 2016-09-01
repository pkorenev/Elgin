class CreateServices < ActiveRecord::Migration
  def up
    create_table :services do |t|
      t.string :name
      t.text :short_description
      t.string :url_fragment
      t.boolean :published
      t.integer :sorting_position
      t.attachment :avatar
      t.attachment :banner
      t.text :content

      t.timestamps null: false
    end

    Service.create_translation_table(:name, :short_description, :url_fragment, :content)
  end

  def down
    Service.drop_translation_table

    drop_table :services
  end
end
