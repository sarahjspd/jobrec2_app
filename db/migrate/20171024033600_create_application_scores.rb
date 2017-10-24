class CreateApplicationScores < ActiveRecord::Migration[5.1]
  def change
    create_table :application_scores do |t|

    	t.bigint :application_id
    	t.bigint :job_id
    	t.decimal :ascore
    	t.timestamps
    end

    add_foreign_key :application_scores, :Applications, column: :application_id, primary_key: :id
    add_foreign_key :application_scores, :Jobs, column: :job_id, primary_key: :id

  end
end
