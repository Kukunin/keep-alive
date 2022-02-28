class Request < ApplicationRecord
  validates :region, presence: true
  validates :city, presence: true
  validates :reporter_ip, presence: true
end
