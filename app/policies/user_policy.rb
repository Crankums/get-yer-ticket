class UserPolicy < ApplicationPolicy
    attr_reader :user, :user

    def index?
        user.admin == true
    end

    
    
    def create?
        user.admin == true
    end

    def destroy?
        user.admin == true
    end

end
