class UserPolicy < ApplicationPolicy
    attr_reader :user, :user

    def create
        user.admin == true
    end

end
