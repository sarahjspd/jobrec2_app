class AddBannerPicToJobTitles < ActiveRecord::Migration[5.1]
  def change
    add_column :JobTitles, :image, :string
  end
end
