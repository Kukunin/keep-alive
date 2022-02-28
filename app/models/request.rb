class Request < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :region, presence: true, inclusion: { in: Region.regions }
  validates :city, presence: true
  validates :reporter_ip, presence: true
end
