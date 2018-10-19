class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.string :file
      t.integer :attachment_id
      t.string :attachment_type

      t.timestamps
    end
    add_index :attachments, :attachment_type
    add_index :attachments, :attachment_id
  end
end
