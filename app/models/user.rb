class User < ApplicationRecord
  has_many :addresses
  validates :full_name, presence: true
  validates :sub_seats, presence: true
  validates :sub_seats, numericality: { only_integer: true } 
end
