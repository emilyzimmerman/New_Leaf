class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :description
      t.string :image_path, default: "https://st.depositphotos.com/1035837/1535/i/450/depositphotos_15353721-stock-photo-leaves.jpg"

      t.timestamps
    end
  end
end
