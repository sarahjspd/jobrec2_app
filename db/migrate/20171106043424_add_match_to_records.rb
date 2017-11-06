class AddMatchToRecords < ActiveRecord::Migration[5.1]
  def change
  	add_column :records, :applicant_id, :bigint

  end
end
