class AddRequestIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :request_id, :integer
  end
end
