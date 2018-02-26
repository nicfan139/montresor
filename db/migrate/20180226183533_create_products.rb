class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :category
      t.text :description
      t.string :state, default: "pending"

      t.timestamps
    end
  end
end
