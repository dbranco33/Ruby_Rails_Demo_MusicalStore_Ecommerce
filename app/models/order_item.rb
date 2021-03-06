class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present
  validates :order_id,
            uniqueness: { scope: [:product_id],
                          message: 'Product already added.' }

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

  private

  def product_present
    return unless product.nil?
    errors.add(:product, 'is not valid or is not active.')
  end

  def order_present
    return unless order.nil?
    errors.add(:order, 'is not a valid order.')
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
