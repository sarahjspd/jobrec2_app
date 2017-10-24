class ActionLogs < ActiveRecord::Base
  set_table_name 'ActionLogs'
  set_primary_key :id
  validate :id, :action, :createdAt, :updatedAt, presence: true
  
end
