class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :forename
      t.string :surname
      t.string :street_address
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :telephone
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
