class MovieShowsController < ApplicationController
  #collbacks
  before_action :find_movie_show_id, only: %i[show]
  before_action :find_screen_id, only: %i[new create]

  def new
    @movie_show = @screen.movie_shows.build
  end

  def show; end
  
  def create
    @movie_show = @screen.movie_shows.build((movie_show_params))
    if @movie_show.save
      redirect_to manager_screen_movie_show_path(current_manager, @screen, @movie_show)
    else
      render 'new'
    end
  end

  private

  def movie_show_params
    params.require('movie_show').permit(:date, :time)
  end

  def find_movie_show_id
    @movie_show  = MovieShow.find_by(id: params[:id])
  end

  def find_screen_id
    @screen = Screen.find_by(id: params[:screen_id])
  end
end
