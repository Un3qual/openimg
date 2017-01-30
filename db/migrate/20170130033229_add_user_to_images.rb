class AddUserToImages < ActiveRecord::Migration[5.0]
  def change
    add_reference :images, :user, type: :string, foreign_key: true
  end
end
