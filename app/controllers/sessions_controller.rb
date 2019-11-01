class SessionsController < ApplicationController
    
    def new
    end

    def create
        user = User.find_by_name(params[:name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            @user = user
            redirect_to '/calendars/week'
        else
            flash[:error] = "Invalid name or password, please try again or click below to sign up"
            redirect_to login_path
        end
    end

    def googleAuth
        access_token = request.env["omniauth.auth"]
        user = User.from_google(access_token)
        @user.google_token = access_token.credentials.token
        refresh_token = access_token.credentials.refresh_token
        @user.google_refresh_token = refresh_token if refresh_token.present?
        if @user.save
            log_in(@user)
            flash[:success] = "Welcome #{@user.name}!"
            redirect_to '/calendars/week'
        else
            flash[:danger] = "Login credentials invalid, please retry"
            redirect_to login_path
        end

    end

    def githubAuth
        if auth_hash = request.env['omniauth.auth']
            oauth_email = request.env["omniauth.auth"]["email"]
            if  user = User.find_by(:email => oauth_email)
                session[:user_id]= user.id
            else
                user = User.create(:email => oauth_email)
                session[:user_id] = user.id
                redirect_to '/calendars/week'
            end
        else
            user = User.find_by(:email => params[:email])
            if user && user.authenticate(params[:uid])
                session[:user_id]= user.id
                redirect_to '/calendars/week'
            else
                render 'sessions/new'
            end
        end
    end

    def destroy
        session.clear
        flash[:notice] = "Successfully logged out"
        redirect_to root_path
    end

    private 
    
    def user_params
        params.require(:user).permit(:name, :uid, :image, :email)
    end
end
