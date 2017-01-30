class RemoveUnusedFileColumns < ActiveRecord::Migration[5.0]
  def change
  	remove_column :images, :file_type
  	remove_column :images, :s3_file_name
  end
end
