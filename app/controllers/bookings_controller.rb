class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end
  
  def index
    @bookings = Booking.all
  end
  
  def edit
    @booking = Booking.find(params[:id])
  end
  
  def update
    @booking = Booking.find(params[:id])
    if @booking.update(params.require(:booking).permit(:guestname, :checkin, :checkout, :price))
      flash[:notice] = "Booking was updated successfully."
      redirect_to @booking
    else
      render 'edit'
    end
  end
  
end