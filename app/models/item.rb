class Item < ApplicationRecord
    belongs_to :admin
    belongs_to :end_user

    attachment :image
end
