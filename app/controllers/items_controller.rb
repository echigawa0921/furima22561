class ItemsController < ApplicationController
    def index
    end
    
    def new
        @item = Item.new
    end

    def create
    end

    private

    def itemes_params
        params.require(:item).permit(:name, :explanation, :categoly_id, :status_id,:shipping_charge_id, :shipping_region_id, :days_until_shipping_id,:price, :image).merge(user_id: current_user.id)
    end
end
