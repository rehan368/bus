class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user=User.new(params.require(:user).permit(:username, :email, :password))
        if @user.save
           #session[:user_id] = @user.id
            flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
            redirect_to root_path
        else
            render 'new'
        end
    end

end
