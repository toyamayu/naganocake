class CartItem < ApplicationRecord
    belongs_to :item
    belongs_to :end_user

    validates :end_user_id, presence: true
    validates :item_id, presence: true
    validates :amount, presence: true

end
