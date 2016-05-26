class AddImagesToPost < ActiveRecord::Migration
  def change
    add_column :posts, :image1, :string, presence: false
    add_column :posts, :image2, :string, presence: false
    add_column :posts, :image3, :string, presence: false
  end
end
