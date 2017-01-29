class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images, id: false, force: true do |t|
      t.string :id, null: false
      t.text :caption
      t.string :file_type
      t.text :s3_file_name

      t.timestamps
    end
    add_index "images", ["id"], name: "index_images_on_id", unique: true, using: :btree
  end
end
