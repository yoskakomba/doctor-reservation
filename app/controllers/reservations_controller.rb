class ReservationsController < ApplicationController
    def index
        @reservations = Reservation.all
    end
    
    def show
        @reservation = Reservation.find(params[:id])
    end 
    
    def new
       @reservation = Reservation.new 
    end
    
    def create
        @reservation = Reservation.new(reservation_params)
        @reservation.patient = Patient.find(1)
        
        if @reservation.save
            flash[:success] = "Your reservation was created succesfully!"
            redirect_to reservations_path
        else
            render :new
        end
    end
    
    def edit 
        @reservation = Reservation.find(params[:id])
    end
    
    def update
        @reservation = Reservation.find(params[:id])
        if @reservation.update(reservation_params)
            flash[:success] = "Your reservation was updated succesfully!"
            redirect_to reservation_path(@reservation)
        else
            render :edit
        end
    end
    
    private
    
        def reservation_params
           params.require(:reservation).permit(:name, :summary, :description)
        end
    
end