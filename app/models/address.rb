class Address < ApplicationRecord
  belongs_to :user
  
  validates :address1, presence: true
  validates :postal_code, presence: true
  validates :city, presence: true
  validates :country, presence: true
end
