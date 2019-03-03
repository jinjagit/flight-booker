class FlightsController < ApplicationController

  def index
    @flights = Flight.all
  end

  def find
    @airports = Airport.all
  end

  private

    def user_params
      params.require(:flight).permit(:flight_id, :date, :num_passengers)
    end
end
