class DropIdofRequests < ActiveRecord::Migration
  def change
  	remove_column :requests, :request_id, :integer
  end
end
