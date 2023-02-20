class CreateActivitiesCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :activities_categories do |t|
      t.integer :activity_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
