class AddRequestIdToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :request_id, :integer
  end
end
