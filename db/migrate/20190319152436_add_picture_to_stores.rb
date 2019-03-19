class AddPictureToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :picture, :string
  end
end
