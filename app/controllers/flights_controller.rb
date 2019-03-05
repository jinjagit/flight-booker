class FlightsController < ApplicationController

  def index
    unless params[:find_flights].nil?
      @flights_found = Flight.where(from_id: params[:find_flights][:from],
                                    to_id: params[:find_flights][:to]).all
      @passenger_count = params[:find_flights][:passenger_count]
      @date = params[:find_flights][:date]
      session[:saved_search] = params
    end
  end

  def list
    @flights = Flight.all
  end
end
