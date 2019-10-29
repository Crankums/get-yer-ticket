class Bike < ApplicationRecord
    belongs_to :customer
end

# admin notes for bikes "probably stolen"
# what other methods or attributes does a bike need? warranty? last tune-up? <= that's not a bad one