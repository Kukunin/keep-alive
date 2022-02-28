class AddTitleToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :title, :string, null: false, default: '<undefined>'
    change_column_default :requests, :title, from: '<undefined>', to: nil
  end
end
