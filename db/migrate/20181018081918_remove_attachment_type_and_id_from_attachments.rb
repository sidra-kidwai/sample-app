class RemoveAttachmentTypeAndIdFromAttachments < ActiveRecord::Migration[5.2]
  def change
    remove_column :attachments, :attachment_type, :string
    remove_column :attachments, :attachment_id, :integer
  end
end
