class OrdersController < ApplicationController

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
end

class OrdersController < ApplicationController

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
end