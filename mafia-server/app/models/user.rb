class User < ApplicationRecord
  has_secure_password
  belongs_to :rooms, optional: true
  validates :name, presence: true
  validates :password, presence: true, on: :create

  has_many :gameStates, through: :rooms
  has_many :messages
end
