class CreateCategoryScores < ActiveRecord::Migration[5.1]
  def change
    create_table :category_scores do |t|
    	
    	t.bigint :job_category_id
    	t.bigint :job_id
    	t.decimal :cscore
    	t.timestamps
    end

    add_foreign_key :category_scores, :JobCategories, column: :job_category_id, primary_key: :id
    add_foreign_key :category_scores, :Jobs, column: :job_id, primary_key: :id

  end
end
