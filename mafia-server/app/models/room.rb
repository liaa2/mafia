class Room < ApplicationRecord
    has_many :users
    has_many :gameStates, through: :users
    validates :name,:presence => true
end
