class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :suite_number
      t.string :city
      t.string :zip_code
      t.string :country

      t.timestamps
    end
  end
end
