class MoviesController < ApplicationController
  #collbacks
  before_action :find_movie_id, only: %i[show edit delete]
  def index
    @movies = Movie.all
  end

  def new
    @movie = current_manager.movies.build
  end

  def show; end

  def create
    @movie = current_manager.movies.build(movie_params)
    if @movie.save
      redirect_to manager_movie_path(current_manager, @movie)
    else
      render 'new'
    end
  end

  private

  def movie_params
    params.require('movie').permit(:name, :movie_type, :votes, :rates, :summary, :static_review, :tailer, :screen_number, :release_date, :end_date, :time)
  end

  def find_movie_id
    @movie = Movie.find_by(id: params[:id])
  end
end
