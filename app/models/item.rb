class Item < ApplicationRecord
    belongs_to :user
    has_one :order
    has_one_attached :image

    private

    def itemes_params
        params.require(:item).permit(:name, :explanation, :categoly_id, :status_id,:shipping_charge_id, :shipping_region_id, :days_until_shipping_id,: price, :created_at,:update_at, :user_id).merge(user_id: current_user.id)
    end
end
