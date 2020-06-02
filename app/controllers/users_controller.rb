class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy]
    before_action :require_user
    before_action :require_same_user, only: [:edit, :update, :destroy]
    def new
        @user = User.new
    end
    
    def create
        @user=User.new(params.require(:user).permit(:username, :email, :password))
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to the Online Bus Booking #{@user.username}, you have successfully signed up"
            redirect_to new_reservation_path
        else
            render 'new'
        end
    end
    
    def edit
        
    end

    def update
        if @user.update(params.require(:user).permit(:username, :email, :password))
            flash[:notice] = "Your account information was successfully updated"
            redirect_to new_reservation_path
        else
            render 'edit'
        end
    end

    def destroy 
        @user.destroy
        session[:user_id]=nil 
        flash[:notice] = "Account and all associated reservations successfully deleted"
        redirect_to root_path
    end
    private
    def set_user
        @user=User.find(params[:id])
    end
    def require_same_user
        if current_user!=@user
            flash[:alert]="You can only edit or delete your own account"
            redirect_to root_path
        end
    end
end
