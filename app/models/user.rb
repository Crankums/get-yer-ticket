class User < ApplicationRecord
    has_many :tickets
    has_many :customers, through: :tickets
    has_secure_password

    validate :name, presence: true
    validate :password, presence: true, length: {in: 6..10 }
    validate :email, presence: true
    # add :role["Mechanic", "Shop Manager", "Sales"]
end
