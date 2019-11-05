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
        @user = User.from_google(access_token)
        @user.google_token = access_token.credentials.token
        refresh_token = access_token.credentials.refresh_token
        @user.google_refresh_token = refresh_token if refresh_token.present?
        if @user.save
            session[:user_id]=@user.id
            flash[:success] = "Welcome #{@user.name}!"
            redirect_to '/calendars/week'
        else
            flash[:error] = @user.errors.full_messages
            redirect_to login_path
        end
    end

    # def githubAuth
    #     if auth_hash = request.env['omniauth.auth']
    #         oauth_email = request.env["omniauth.auth"]["email"]
    #         if  user = User.find_by(:email => oauth_email)
    #             session[:user_id]= user.id
    #         else
    #             user = User.create(:email => oauth_email)
    #             session[:user_id] = user.id
    #             redirect_to '/calendars/week'
    #         end
    #     else
    #         user = User.find_by(:email => params[:email])
    #         if user && user.authenticate(params[:uid])
    #             session[:user_id]= user.id
    #             redirect_to '/calendars/week'
    #         else
    #             render 'sessions/new'
    #         end
    #     end
    # end

    # def facebookAuth
    #     @user = User.find_or_create_by(uid: auth['uid']) do |u|
    #         u.name = auth['info']['name']
    #         u.email = auth['info']['email']
    #         u.image = auth['info']['image']
    #     end
    #         session[:user_id] = @user.id
    #         render 'welcome/home'
    # end

    def destroy
        session.clear
        flash[:notice] = "Successfully logged out"
        redirect_to root_path
    end

    private 
    
    def user_params
        params.require(:user).permit(:name, :google_token, :google_refresh_token, :google_uid, :uid, :image, :email)
    end

    def auth
        request.env['omniauth.auth']
    end
end
