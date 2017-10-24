class AddBannerPicToJobTitles < ActiveRecord::Migration[5.1]
  def change
    add_column :JobTitles, :banner_pic, :string
  end
end
