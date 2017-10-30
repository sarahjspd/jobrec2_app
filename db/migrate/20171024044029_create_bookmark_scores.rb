class CreateBookmarkScores < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmark_scores do |t|
    
    	t.bigint :originaljob_id
    	t.bigint :job_id
    	t.decimal :bscore
    	t.timestamps
    end

    add_foreign_key :bookmark_scores, :Jobs, column: :originaljob_id, primary_key: :id
    add_foreign_key :bookmark_scores, :Jobs, column: :job_id, primary_key: :id



    
  end
end
