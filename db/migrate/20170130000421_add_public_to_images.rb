class AddPublicToImages < ActiveRecord::Migration[5.0]
  def change
  	add_column :images, :is_public, :boolean, :default => true
  end
end
