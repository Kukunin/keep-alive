class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.bigint :request_id, null: false, index: true
      t.string :username, null: false
      t.string :message, null: false
      t.string :ip_address, null: false

      t.timestamps
    end

    add_foreign_key :comments, :requests, on_delete: :cascade
  end
end
