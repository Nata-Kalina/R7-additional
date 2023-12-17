class Order < ApplicationRecord
    belongs_to :customer
    validates_associated :customer

    validates :product_name, presence: true, length: {maximum: 50}
    validates :product_count, presence: true, numericality: { only_integer: true, greater_than: 0}
end
