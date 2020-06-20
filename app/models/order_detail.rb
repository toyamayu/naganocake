class OrderDetail < ApplicationRecord

    belongs_to :order
    belongs_to :item

    enum production_status: {
        standby: 0,
        redy_to_producting: 1,
        producting: 2,
        finish: 3
    }
end
