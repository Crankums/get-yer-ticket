class User < ApplicationRecord
    has_many :tickets
    has_many :customers, through: :tickets
    has_secure_password

    # add :role["Mechanic", "Shop Manager", "Sales"]
end
