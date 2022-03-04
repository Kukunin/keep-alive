class AddIndexesToRequestTags < ActiveRecord::Migration[7.0]
  def change
    # To avoid duplicate tags
    add_index :requests_tags, [:request_id, :tag_id], :unique => true
  end
end