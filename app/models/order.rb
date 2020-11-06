class Order < ApplicationRecord
    
    belongs_to :user
    belongs_to :item
    has_one :jusyo

    validates :price, presence: true
end
