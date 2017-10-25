class AddBannerPicToJobCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :JobCategories, :image, :string
  end
end
