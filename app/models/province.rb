class Province < ApplicationRecord
  has_many :user
  validates :name, :pst, presence: true
end
