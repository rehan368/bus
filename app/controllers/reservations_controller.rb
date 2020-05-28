class ReservationsController < ApplicationController
    def new

    end

    def create

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
