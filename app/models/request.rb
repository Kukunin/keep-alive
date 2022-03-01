class Request < ApplicationRecord
  STATUSES = %w[new active done].freeze
  TYPES = %w[ask provide].freeze

  self.inheritance_column = nil

  belongs_to :user, optional: true
  has_many :comments
  broadcasts

  validates :title, presence: true, length: { maximum: 100 }
  validates :region, presence: true, inclusion: { in: Region.regions }
  validates :city, presence: true, length: { maximum: 100 }
  validates :address, length: { maximum: 100 }
  validates :contact_name, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }
  validates :phone, length: { maximum: 50 }
  validates :telegram, length: { maximum: 50 }
  validates :skype, length: { maximum: 50 }
  validates :reporter_ip, presence: true

  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :type, presence: true, inclusion: { in: TYPES }

  validates :phone, presence: true, if: -> { viber && %w[f 0].exclude?(viber) }
  validate :at_least_one_contact_is_there

  def self.statuses
    STATUSES
  end

  def self.types
    TYPES
  end

  def human_status
    self.class.human_status(status)
  end

  def human_type
    self.class.human_type(type)
  end

  def self.human_status(status)
    I18n.t(status, scope: 'activerecord.attributes.request.status_enum')
  end

  def self.human_type(type)
    I18n.t(type, scope: 'activerecord.attributes.request.type_enum')
  end

  private

  CONTACT_FIELDS = %i[address phone telegram skype].freeze

  def at_least_one_contact_is_there
    return if CONTACT_FIELDS.map { |field| send(field).presence }.any?

    errors.add(:base, I18n.t('requests.at_least_one_contact'))
  end
end
