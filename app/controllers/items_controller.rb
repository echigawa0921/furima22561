class ItemsController < ApplicationController
    before_action :authenticate_user! ,only: [:new, :create]

    def index
        @items =Item.all
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

    def show
        @item = Item.find(params[:id])
    end

    def edit
        @item = Item.find(params[:id])
    end
    
    def update
        @item = Item.find(params[:id])
        @item.update(item_params)
    end


    def destroy
        @item = Item.find(params[:id])
        if @item.destroy
          redirect_to controller: :items, action: :index
        else
          render "show"
        end
      end

    private

    def items_params
        params.require(:item).permit(:name, :explanation,:category_id, :status_id,:shipping_charge_id, :shipping_region_id, :days_until_shipping_id,:price, :image).merge(user_id: current_user.id)
    end


end
