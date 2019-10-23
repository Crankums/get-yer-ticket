class Customer < ApplicationRecord
    has_many :bikes
    has_many :tickets
    has_many :users, through: :tickets
end
