class CreateTestimonials < ActiveRecord::Migration
  def up
    create_table :testimonials do |t|
      t.string :name
      t.string :position
      t.text :content
      t.attachment :avatar
      t.integer :sorting_position
      t.boolean :published

      t.timestamps null: false
    end

    Testimonial.create_translation_table(:name, :position, :content)
  end

  def down
    Testimonial.drop_translation_table

    drop_table :testimonials
  end
end
