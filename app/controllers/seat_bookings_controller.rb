class SeatBookingsController < ApplicationController
  before_action :find_seat_id, only: %i[show]
  before_action :find_movie_show_id, only: %i[new create]

  def new
    @seat_booking = @movie_show.seat_booking.build
  end

  def show; end
  
  def create
    @seat_booking = @movie_show.seat_booking.build(seat_booking_params)
    if @seat_booking.save
      redirect_to manager_screen_movie_show_seat_booking_path(current_manager, @movie_show.screen, @movie_show, @seat_booking)
    end
  end

  private

  def seat_booking_params
    params.require('seat_booking').permit(:seat_no)
  end

  def find_seat_id
    @seat_booking = SeatBooking.find_by(id: params[:id])
  end

  def find_movie_show_id
    @movie_show = MovieShow.find_by(id: params[:movie_show_id])
  end
end
