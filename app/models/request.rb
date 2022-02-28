class Request < ApplicationRecord
  validates :region, presence: true, inclusion: { in: Region.regions }
  validates :city, presence: true
  validates :reporter_ip, presence: true
end
