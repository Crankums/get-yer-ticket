class Customer < ApplicationRecord
    has_many :bikes
    accepts_nested_attributes_for :bikes
    has_many :tickets
    has_many :users, through: :tickets

    validates :name, format: { with: /\A[A-Za-z]+\z/, message: "Name can only contain letters"}
    validates :email, format: { with: /@/, message: "A valid email is required" }
    validates :phone_number, presence: true

    scope :duplicates
         -> 
         {dup_custies = Customer.group(:name).having("count(*) > 1").pluck(:name)
         current_scope.where(name: dup_custies)               }
    
    def self.search(search)
        customer = Customer.where("name LIKE ?", "%#{search}%")
    end
    # Customer bikes should be an index view w/ links leading to show pages for individual bikes
end
