class AddAttachmentAttachmentToRequests < ActiveRecord::Migration
  def self.up
    change_table :requests do |t|
      t.attachment :attachment
    end
  end

  def self.down
    drop_attached_file :requests, :attachment
  end
end
