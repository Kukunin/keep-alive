class AddTypeToRequests < ActiveRecord::Migration[7.0]
  def change
    create_enum :request_type, %w[ask provide]
    add_column :requests, :type, :string, null: false, default: 'ask'
    add_index :requests, :type
  end
end
