class UsersController < ApplicationController

    skip_before_action :login_required, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in(@user)
            flash[:success] = "Welcome to the Sample App!"
            redirect_to blogs_path
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        @favorites = current_user.favorite_blogs
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password,
                                :password_confirmation)
    end
end
