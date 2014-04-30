class RemoveProjects < ActiveRecord::Migration
  def down
  	drop_table :projects
  end
end
