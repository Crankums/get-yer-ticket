class SessionsController < ApplicationController
    
    def new
    end

    def create
    end

    def githubAuth
        if auth_hash = request.env['omniauth.auth']
            oauth_email = request.env["omniauth.auth"]["email"]
            if  user = User.find_by(:email => oauth_email)
                session[:user_id]= user.id
            else
                user = User.create(:email => oauth_email)
                session[:user_id] = user.id
                redirect_to root_path
            end
        else
            user = User.find_by(:email => params[:email])
            if user && user.authenticate(params[:uid])
                session[:user_id]= user.id
                redirect_to root_path
            else
                render 'sessions/new'
            end
        end
    end

    def delete
    end

    private 
    
    def user_params
        params.require(:user).permit(:name, :uid, :image, :email)
    end
end
