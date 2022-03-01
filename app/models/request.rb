class Request < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  broadcasts

  validates :title, presence: true, length: { maximum: 100 }
  validates :region, presence: true, inclusion: { in: Region.regions }
  validates :city, presence: true, length: { maximum: 100 }
  validates :address, length: { maximum: 100 }
  validates :contact_name, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }
  validates :phone, presence: true, length: { maximum: 15 }
  validates :telegram, length: { maximum: 50 }
  validates :skype, length: { maximum: 50 }
  validates :reporter_ip, presence: true
end
