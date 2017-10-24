class CreateSkillScores < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_scores do |t|

    	t.bigint :user_skill_id
    	t.bigint :job_skill_id
    	t.bigint :job_id
    	t.decimal :sscore
    	t.timestamps
    end

    add_foreign_key :skill_scores, :UserSkills, column: :user_skill_id, primary_key: :id
    add_foreign_key :skill_scores, :JobSkills, column: :job_skill_id, primary_key: :id
    add_foreign_key :skill_scores, :Jobs, column: :job_id, primary_key: :id

  end
end
