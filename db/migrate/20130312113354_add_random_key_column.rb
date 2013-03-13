class AddRandomKeyColumn < ActiveRecord::Migration
  def change
    add_column :posts, :random_key, :string
  end
end
