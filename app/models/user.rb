class User < ApplicationRecord
    has_many :tickets
    has_many :customers, through: :tickets
    has_secure_password

    validates :name, presence: true, uniqueness: true
    validates :password, length: {minimum: 6 }
    validates :password_confirmation, length: {minimum: 6 }
    validates :email, format: { with: /@/, message: "A valid email is required" }
    validates :google_uid, presence: true, allow: nil
    validates :google_refresh_token, presence: true, allow: nil
    
    
    def self.from_google(auth)
        refresh_token = auth.credentials.refresh_token
        if (found_user = User.find_by(email: auth.info.email))
            found_user.google_uid = auth.credentials.token
            found_user.google_refresh_token = refresh_token if refresh_token.present?
            return found_user
        else
            new_user = User.new do |u|
                u.email = auth.info.email
                u.name = auth.info.name
                u.google_uid = auth.credentials.token
                u.google_refresh_token = refresh_token if refresh_token.present?
                rand_password = SecureRandom.hex
                u.password = rand_password
                u.password_confirmation = rand_password
            end
            return new_user
        end
    end
end
