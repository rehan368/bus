class ReservationsController < ApplicationController
    before_action :set_article, only: [:destroy]
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
        @reservation.destroy
        redirect_to reservations_path
    end

    private
    def set_article
        @reservation = Reservation.find(params[:id])
    end
    def require_same_user
        if current_user!=@reservation.user
            flash[:alert]="You can only delete your own reservation"
            redirect_to reservations_path
        end
    end
end
