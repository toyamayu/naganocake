class CartItem < ApplicationRecord
    belongs_to :item
    belongs_to :end_user

    validates :end_user_id, presence: true
    validates :item_id, presence: true
    # greater_than_or_equal_to: 0 is mean x >=0
    validates :amount, presence: true, numericality: {greater_than_or_equal_to: 0}  

end
