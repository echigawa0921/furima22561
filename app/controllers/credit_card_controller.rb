class CreditCardsController < ApplicationController

    def index
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


    def pay #payjpとCardのデータベース作成
      Payjp.api_key = Rails.application.credentials.development[:PAYJP_PRIVATE_KEY]
      #保管した顧客IDでpayjpから情報取得
      if params['payjp_token'].blank?
        redirect_to new_credit_card_path
      else
        customer = Payjp::Customer.create(
          card: params['payjp_token'],
          metadata: {user_id: current_user.id}
        ) 
        @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
        @user_address = UserAddress.find_by(user_id: current_user.id)
        if @card.save
          # redirect_to credit_card_path(current_user.id)
          redirect_to user_path(current_user.id)
        else
          redirect_to pay_credit_cards_path
        end
      end
    end
  
  end