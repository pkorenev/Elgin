class CreateClientGoals < ActiveRecord::Migration
  def up
    create_table :client_goals do |t|
      t.string :name
      t.text :description
      t.attachment :icon
      t.boolean :published
      t.integer :sorting_position

      t.timestamps null: false
    end

    ClientGoal.create_translation_table(:name, :description)
  end

  def down
    ClientGoal.drop_translation_table

    drop_table :client_goals
  end
end
