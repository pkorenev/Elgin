class CreateAdvantages < ActiveRecord::Migration
  def up
    create_table :advantages do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.boolean :published
      t.integer :sorting_position

      t.timestamps null: false
    end

    Advantage.create_translation_table(:title, :subtitle, :description)
  end

  def down
    Advantage.drop_translation_table

    drop_table :advantages
  end
end
