class AddRequestCountToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :request_count, :integer
  end
end
