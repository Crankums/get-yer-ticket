class User < ApplicationRecord
    has_many :tickets
    has_many :customers, through: :tickets
    has_secure_password

    validate :name, format: { with: /\A[A-Za-z]+\z/, message: "Name can only contain letters"}
    validate :password, length: {minimum: 6 }
    validate :password_confirmation, {minimum: 6 }
    validate :email, format: { with: /@/, message: "A valid email is required" }
    # validate :role, inclusion: {in: %w(Mechanic Manager Sales)}
end
