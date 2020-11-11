class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.integer :user_id, null: false
      t.string :customer_id, null: false
      t.string :card_id, null: false
      t.string :mounth, null: false
      t.string :year, null: false
      t.string :cvc, null: false

      t.timestamps
    end
  end
end