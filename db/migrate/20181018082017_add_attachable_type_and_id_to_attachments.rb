class AddAttachableTypeAndIdToAttachments < ActiveRecord::Migration[5.2]
  def change
    add_column :attachments, :attachable_type, :string, index: true
    add_column :attachments, :attachable_id, :integer, index: true
  end
end
