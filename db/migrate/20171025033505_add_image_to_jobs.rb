class AddImageToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :Jobs, :image, :string
  end
end
