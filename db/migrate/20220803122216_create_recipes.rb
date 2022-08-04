class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name , null: false, default: ''
      t.text :description , null: false, default: ''
      t.decimal :prep_time , null: false, default: 0
      t.decimal :cook_time , null: false, default: 0
      t.text :steps , null: false, default: ''
      t.boolean :public , null: false, default: false
      t.references :user, null: false, foreign_key: { to_table: :users }


      t.timestamps
    end
  end
end
