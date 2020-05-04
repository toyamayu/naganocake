class Item < ApplicationRecord

    # genre_idがなくても投稿ができるようになる。
    belongs_to :genre, optional: true
    has_many :cart_items, dependent: :destroy
    attachment :image
    validates :name, presence: true
    validates :notax_price, presence: true
    validates :is_capable, presence: true



end
