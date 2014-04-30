class DropColumnProjectId < ActiveRecord::Migration
  def change
  	remove_column :requests, :project_id, :integer
  end
end
