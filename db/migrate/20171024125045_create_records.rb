class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|

    	t.bigint :user_id
    	t.bigint :job_id
    	t.bigint :jobrec_id
    	t.decimal :savedscore
    	t.timestamps
    end

    add_foreign_key :records, :Users, column: :user_id, primary_key: :id
    add_foreign_key :records, :Jobs, column: :job_id, primary_key: :id
    add_foreign_key :records, :Jobs, column: :jobrec_id, primary_key: :id

  end
end
