class Order < ApplicationRecord

    # アソシエーション関連
    belongs_to :end_user
    has_many :order_details


    #　enum 
    enum pay_way: {
        creditcard: 0,
        bank: 1
    }

    enum order_status: {
        pay_wait: 0,
        pay_confirmation: 1,
        creating: 2,
        delivery_redy: 3,
        deliveried: 4
    }

    def order_info
        self.postal_code + self.address + self.address_user_name
    end
end
