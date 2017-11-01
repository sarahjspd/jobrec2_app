class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :category_scores, :job_category_id, :originaljob_id
  end
end
