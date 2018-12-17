class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address, optional: true

  before_validation :set_price

  validate :subscription_required  
  validate :address_ownership, if: -> { address_id.present? }  

  validates :user, presence: true  
  validates :address, presence: true, if: -> { completed? }
  validates :beacons, numericality: { greater_than: 0, only_integer: true}, if: -> { completed? }
  validates :total_price, numericality: { greater_than: 0 }, if: -> { completed? }

  enum status: [:pending, :completed] 
  accepts_nested_attributes_for :address

  def subscription_required
    if user.sub_seats <= 0
      errors.add(:beacons, message: "You need to upgrade to order beacons") 
    end
  end

  def address_ownership
    unless address.user_id == user_id
      errors.add(:address, message: "The address does not belong to this user")
    end
  end

  def complete_order
    self.status = "completed"
    save
  end

  def add_beacon
    self.beacons += 1    
    save
  end

  def subtract_beacon
    if beacons > 0 
      self.beacons -= 1       
      save
    end
  end

  def set_price
    self.total_price = beacons * 30
    if(beacons >= 5)
      self.total_price = (beacons * 30) * 0.85
    end
  end
end
