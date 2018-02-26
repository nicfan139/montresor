class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.text :description
      t.integer :price
      t.string :state, default: "pending"

      t.timestamps
    end
  end
end
