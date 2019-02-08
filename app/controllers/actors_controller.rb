class ActorsController < ApplicationController
  #collbacks
  before_action :find_actor_id, only: %i[show destroy]
  before_action :find_movie, only: %i[new create destroy]

  def index
    @actors = Actor.all
  end
  def new
    @actor = @movie.actors.build
  end

  def show; end

  def create
    @actor = @movie.actors.build(actor_params)
    if @actor.save
      redirect_to manager_movie_path(current_manager, @movie)
    else
      render 'new'
    end
  end

  def destroy
    redirect_to manager_movie_path(current_manager, @movie) if @actor.destroy
  end

  private

  def actor_params
    params.require('actor').permit(:name, :actor_image, :role)
  end

  def find_actor_id
    @actor = Actor.find_by(id: params[:id])
  end

  def find_movie
    @movie = Movie.find_by(id: params[:movie_id])
  end
end
