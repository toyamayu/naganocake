class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # delete registration
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable


  
end
