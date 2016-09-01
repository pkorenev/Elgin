class CreateContactRequests < ActiveRecord::Migration
  def change
    create_form_table :contact_requests do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :phone
      t.text :description

      t.timestamps null: false
    end
  end
end
