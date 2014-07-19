class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces, id: false do |t|
      t.string :name
      t.string :name_with_initial

      t.timestamps
    end
  end
end
