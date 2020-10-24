class ItemsController < ApplicationController
    def index
    end
    
    def new
        @item = Item.new
    end

    def create
        @item = Item.new(items_params)
        if @item.save
            redirect_to controller: :items, action: :index
        else
            render "new"
        end
    end

    private

    def items_params
        params.require(:item).permit(:name, :explanation,:category_id, :status_id,:shipping_charge_id, :shipping_region_id, :days_until_shipping_id,:price, :image).merge(user_id: current_user.id)
    end
end
