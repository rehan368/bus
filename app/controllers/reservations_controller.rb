class ReservationsController < ApplicationController
    def new
        @reservation = Reservation.new
    end

    def create
        @reservation = Reservation.new(params.require(:reservation).permit(:name,:from,:to,:doj,:time))
        if  @reservation.save
            flash[:notice]="Ticket booked successfully."
            redirect_to reservations_path
        else
            render 'new'
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
end
