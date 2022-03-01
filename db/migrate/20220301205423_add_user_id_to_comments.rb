class AddUserIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :user_id, :bigint
    change_column_null :comments, :username, true

    add_foreign_key :requests, :users, on_delete: :nullify
    add_foreign_key :comments, :users, on_delete: :cascade
  end
end
