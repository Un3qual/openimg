class AddRoleColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_admin, :boolean, :null => false, :default => false
    add_column :users, :is_moderator, :boolean, :null => false, :default => false
  end
end
