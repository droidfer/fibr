class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :title
      t.string :landline
      t.string :mobile_phone
      t.string :email
      t.integer :department_id
      t.integer :company_id

      t.timestamps
    end
  end
end
