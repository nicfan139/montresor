class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :rating
      t.integer :page
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
