class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.decimal :price
      t.string :email
      t.string :description
      t.string :photo_url
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :category_id

      t.timestamps
    end
  end
end
