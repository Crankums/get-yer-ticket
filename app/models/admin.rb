class Admin < ApplicationRecord
    has_many :customers, through: :tickets
end
