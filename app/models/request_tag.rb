class RequestTag < ApplicationRecord
  self.table_name = "requests_tags"

  validates :tag_id, uniqueness: { scope: :request_id, message: 'Only one instane of each tag is allowed' }
end