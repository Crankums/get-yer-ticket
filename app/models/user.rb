class User < ApplicationRecord
    has_many :tickets
    has_many :customers, through: :tickets
    has_secure_password

    validates :name, format: { with: /\A[A-Za-z]+\z/, message: "Name can only contain letters"}
    validates :password, length: {minimum: 6 }
    validates :password_confirmation, length: {minimum: 6 }
    validates :email, format: { with: /@/, message: "A valid email is required" }
    # validate :role, inclusion: {in: %w(Mechanic Manager Sales)}
end
