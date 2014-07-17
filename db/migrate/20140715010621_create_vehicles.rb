class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :license_plate
      t.string :colour
      t.string :make
      t.string :model
      t.string :year
      t.belongs_to :person, index: true

      t.timestamps
    end
  end
end
