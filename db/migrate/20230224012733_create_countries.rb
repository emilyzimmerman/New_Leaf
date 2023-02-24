class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.integer :year
      t.integer :ghg_amount

      t.timestamps
    end
  end
end
