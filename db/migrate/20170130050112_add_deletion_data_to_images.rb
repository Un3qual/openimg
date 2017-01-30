class AddDeletionDataToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :deleted, :boolean, default: false
    add_column :images, :deleted_by, :string
    add_column :images, :deletion_date, :datetime
    add_column :images, :deletion_reason, :integer
    add_column :images, :deletion_comment, :text
    add_column :images, :user_was_banned, :boolean
  end
end
