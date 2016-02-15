class AddPostTypeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_type, :string
    add_column :posts, :price, :double
    add_column :posts, :phone, :string
  end
end
