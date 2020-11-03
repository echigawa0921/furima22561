class OrdersController < ApplicationController

    def index
        @order = Order.new

      end
    
      def create
        @order = Order.new(order_params)
        if @order.valid?
          @order.save
          return redirect_to root_path
        else
          render 'index'
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
    
      private

      def order_params

      end
    
end