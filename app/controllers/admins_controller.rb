class AdminsController < ApplicationController
    before_action :authenticate
    
    def index
        if !current_user.admin
            flash[:error]= "You are not authorized to view this page"
            redirect_to root_path
        else
            @users = User.all
        end
    end
end
