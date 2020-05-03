class Item < ApplicationRecord

    belongs_to :genre, optional: true
    attachment :image
    validates :name, presence: true
    validates :notax_price, presence: true
    validates :is_capable, presence: true



end
