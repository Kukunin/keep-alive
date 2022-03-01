class Comment < ApplicationRecord
  belongs_to :request, counter_cache: true
  broadcasts_to :request

  validates :username, presence: true, length: { maximum: 100 }
  validates :message, presence: true, length: { maximum: 500 }
  validates :ip_address, presence: true
end
