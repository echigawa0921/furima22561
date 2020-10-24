class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    has_one :order
    has_one_attached :image
    belongs_to_active_hash :category
    belongs_to_active_hash :status
    belongs_to_active_hash :days_shipping_until
    belongs_to_active_hash :shipping_region
    belongs_to_active_hash :shipping_charge
end
