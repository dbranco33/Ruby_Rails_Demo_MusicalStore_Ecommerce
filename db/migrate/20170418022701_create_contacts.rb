class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :phone
      t.string :address
      t.string :email
      t.string :week_hours
      t.string :saturday_hours
      t.string :sunday_hours
      t.string :note

      t.timestamps
    end
  end
end
