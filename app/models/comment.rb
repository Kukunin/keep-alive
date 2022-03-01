class Comment < ApplicationRecord
  belongs_to :request
  broadcasts_to :request

  validates :username, presence: true, length: { maximum: 100 }
  validates :message, presence: true, length: { maximum: 500 }
  validates :ip_address, presence: true
end
