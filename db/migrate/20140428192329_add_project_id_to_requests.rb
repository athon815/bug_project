class AddProjectIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :project_id, :integer
  end
end
