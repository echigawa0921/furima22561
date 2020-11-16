class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user 
    has_one :order ,dependent: :destroy
    has_one_attached :image
    belongs_to_active_hash :category
    belongs_to_active_hash :status
    belongs_to_active_hash :days_until_shipping
    belongs_to_active_hash :shipping_region
    belongs_to_active_hash :shipping_charge
 
    validates :image,:name,:explanation,:category_id,:status_id,:shipping_charge_id,:shipping_region_id,:days_until_shipping_id, presence: true 
    validates :price, :numericality => { :greater_than_or_equal_to => 300 }
    validates :price, :numericality => { :less_than_or_equal_to => 9999999} 
    validates :price, presence: true, format:{with: /\A[0-9]+\z/}
end
