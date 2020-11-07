class UserItemOrder

    include ActiveModel::Model
    attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :builing_name, :phone_number
  
    with_options presence: true do
      validates :postal_code, :prefecture_id, :city, :house_number, :phone_number
      validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
      validates :phone_number, format: {with: /\A\d{10}$|^\d{11}\z/ }
      validates :prefecture_id, numericality: { other_than: 1 }
    end
  
    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      Jusyo.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, builing_name: builing_name,phone_number: phone_number, order_id: order.id)
    end
end
  