class AddImageToTitles < ActiveRecord::Migration[5.1]
  def change
    add_column :Users, :image, :string
  end
end
