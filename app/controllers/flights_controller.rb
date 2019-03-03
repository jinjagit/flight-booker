class FlightsController < ApplicationController

  def index
    unless params[:find_flights].nil?
      puts "params: #{params}"
      @flights_found = Flight.where(from_id: params[:find_flights][:from],
                                    to_id: params[:find_flights][:to]).all
      @flights_found.each { |f| p f}
    end
  end

  def list
    @flights = Flight.all
  end

  private

    def user_params
      params.require(:find_flights).permit(:from, :to)
    end
end
