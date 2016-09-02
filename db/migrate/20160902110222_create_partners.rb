class CreatePartners < ActiveRecord::Migration
  def up
    create_table :partners do |t|
      t.string :name
      t.string :position
      t.text :description
      t.boolean :published
      t.integer :sorting_position

      t.timestamps null: false
    end

    Partner.create_translation_table(:name, :position, :description)
  end

  def down
    Partner.drop_translation_table

    drop_table :partners
  end
end
