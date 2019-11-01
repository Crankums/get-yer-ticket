class UsersController < ApplicationController
    before_action :authenticate

    def show
        @user = User.find(params[:id])
    end

    def new
        # binding.pry
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            log_in(@user)
            flash[:success] = "Welcome #{@user.name}"
            redirect_to user_path(@user)
        else
            flash[:danger] = "Sorry, your account could not be created"
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    end
    
end
