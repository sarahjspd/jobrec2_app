class AddBannerPicToJobCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :JobCategories, :banner_pic, :string
  end
end
