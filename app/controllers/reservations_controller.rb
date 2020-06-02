class ReservationsController < ApplicationController
    before_action :require_user
    before_action :require_same_user, only: [:destroy]
    def new
        @reservation = Reservation.new
    end

    def create
        @reservation = Reservation.new(params.require(:reservation).permit(:name,:from,:to,:doj,:time))
        @reservation.user=current_user
        if params[:reservation][:from].eql?params[:reservation][:to]
            flash.now[:alert] = "Source and destination can't be same"
            render 'new'
        else
            if  @reservation.save
                flash[:notice]="Ticket booked successfully."
                redirect_to reservations_path
            else
                render 'new'
            end
        end
    end
    
    def index
        @reservations = Reservation.all
    end
    
    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy
        redirect_to reservations_path
    end

    def require_same_user
        if current_user!=@reservation.user
            flash[:alert]="You can only edit or delete your own article"
            redirect_to reservations_path
        end
    end
end
