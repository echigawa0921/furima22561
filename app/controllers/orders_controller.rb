class OrdersController < ApplicationController
  before_action :authenticate_user!,only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  

      def index
        @order = UserItemOrder.new
      end
    
      def create
        @order = UserItemOrder.new(order_params)

        if @order.valid?
          @order.save
          return redirect_to root_path
        else
          render 'index'
        end
      end


    private

    def order_params
      params.require(:user_item_order).permit(:postal_code, :prefecture_id,:city, :house_number, :builing_name, :phone_number).merge(user_id: current_user.id).merge(item_id: params[:item_id])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: item_purchase_params[:token],
        currency:'jpy'
      )
    end

    def set_item
      @item = Item.find(params[:item_id])
    end
end

