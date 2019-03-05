class BookingsController < ApplicationController

  def new
    if params.has_key?(:flight_select) == false
      session[:error_select] = true
      redirect_to flights_path(session[:saved_search])
    end

    @date = verbose_date(params[:flight_date])
  end
end
