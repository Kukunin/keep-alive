class User < ApplicationRecord
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :omniauthable

  has_one_attached :avatar
  has_person_name

  has_many :notifications, as: :recipient
  has_many :services
  has_many :requests

  def username
    [first_name, last_name&.slice(0)].filter(&:present?).join(' ')
  end
end
