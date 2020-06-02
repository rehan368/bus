class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user=User.new(params.require(:user).permit(:username, :email, :password))
        if @user.save
           #session[:user_id] = @user.id
            flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
            redirect_to new_reservation_path
        else
            render 'new'
        end
    end
    
    def edit
        @user=User.find(params[:id])
    end

    def update
        @user=User.find(params[:id])
        if @user.update(params.require(:user).permit(:username, :email, :password))
            flash[:notice] = "Your account information was successfully updated"
            redirect_to new_reservation_path
        else
            render 'edit'
        end
    end

    def destroy 
        @user=User.find(params[:id])
        @user.destroy
        #session[:user_id]=nil if @user==current_user
        flash[:notice] = "Account and all associated articles successfully deleted"
        redirect_to root_path
    end
end
