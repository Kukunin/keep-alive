class Comment < ApplicationRecord
  belongs_to :request, counter_cache: true
  belongs_to :user, optional: true
  broadcasts_to :request

  validates :username, length: { maximum: 100 }
  validates :message, presence: true, length: { maximum: 500 }
  validates :ip_address, presence: true

  validates :username, presence: true, unless: :user
  validates :user, presence: true, unless: :username?
end
