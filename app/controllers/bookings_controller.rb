class BookingsController < ApplicationController

  def index
    !params[:bookings].blank? ? @bookings = Booking.where(id: params[:bookings]).all : @bookings = Booking.all
  end

  def new
    if params.has_key?(:flight_select) == false
      flash[:error_select] = true
      redirect_to flights_path(session[:saved_search])
    end
    @passenger_count = params[:passenger_count].to_i
    @date = verbose_date(params[:flight_date])
    @booking = Booking.new(flight_id: Flight.find_by(id: params[:flight_id]), date: params[:flight_date])
  end

  def create
    @passenger_count = params[:booking][:passenger_count].to_i
    @created_bookings = []

    @passenger_count.times do |index|
      @booking = Booking.new(
        flight_id: params[:booking][:flight_id],
        date: params[:booking][:date],
        passenger_attributes: {name:  params[:passengers][:"name#{index + 1}"],
                               email: params[:passengers][:"email#{index + 1}"]})
      @booking.save
      @created_bookings << @booking
    end
    flash[:notice] = "Congratulations! Your flight has been booked"
    redirect_to controller: 'bookings', action: 'index', bookings: @created_bookings
  end
end
