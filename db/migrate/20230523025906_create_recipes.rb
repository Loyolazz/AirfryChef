class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.string :category
      t.string :time_unit
      t.integer :time_value
      t.boolean :featured
      t.boolean :published
      t.string :slug
      t.integer :user_id
      t.integer :category_id
      t.timestamps
    end
  end
end
