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
  validates :phone, length: { maximum: 15 }
  validates :telegram, length: { maximum: 50 }
  validates :skype, length: { maximum: 50 }
  validates :reporter_ip, presence: true

  validates :phone, presence: true, if: -> { viber && %w[f 0].exclude?(viber) }
  validate :at_least_one_contact_is_there

  private

  CONTACT_FIELDS = %i[address phone telegram skype].freeze

  def at_least_one_contact_is_there
    return if CONTACT_FIELDS.map { |field| send(field).presence }.any?

    errors.add(:base, I18n.t('requests.at_least_one_contact'))
  end
end
