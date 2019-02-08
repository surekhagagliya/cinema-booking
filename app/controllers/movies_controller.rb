class MoviesController < ApplicationController
  #collbacks
  before_action :authenticate_manager!
  before_action :find_movie_id, only: %i[show edit update destroy]

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

  def edit; end

  def update
    if @movie.update(movie_params)
      redirect_to manager_movie_path(current_manager, @movie)
    else
      render 'edit'
    end
  end

  def destroy
    manager_movies_path(current_manager, @movie) if @movie.destroy
  end

  private

  def movie_params
    params.require('movie').permit(:image, :cover_image, :name, :movie_type, :price, :summary, :static_review, :tailer, :screen_id, :release_date, :end_date)
  end

  def find_movie_id
    @movie = Movie.find_by(id: params[:id])
  end
end
