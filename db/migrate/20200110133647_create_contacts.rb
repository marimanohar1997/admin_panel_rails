class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :address
      t.string :city
      t.integer :mobile
      t.string :description
      t.string :pincode

      t.timestamps
    end
  end
end
