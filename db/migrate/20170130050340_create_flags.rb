class CreateFlags < ActiveRecord::Migration[5.0]
  def change
    create_table :flags, id: false, force: true do |t|
      t.string :id, null: false
      t.references :user, foreign_key: true, type: :string
      t.text :comment, null: false
      t.integer :reason, null: false
      t.references :image, foreign_key: true, type: :string
      t.boolean :action_taken
      t.integer :action
      t.string :action_taken_by
      t.text :action_comment

      t.timestamps
    end
    add_index "flags", ["id"], name: "index_flags_on_id", unique: true, using: :btree
  end
end
