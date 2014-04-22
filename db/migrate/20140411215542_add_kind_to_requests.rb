class AddKindToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :kind, :string
  end
end
