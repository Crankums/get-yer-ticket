class Customer < ApplicationRecord
    has_many :bikes
    has_many :tickets
    has_many :users, through: :tickets

    # Customer bikes should be an index view w/ links leading to show pages for individual bikes
end
