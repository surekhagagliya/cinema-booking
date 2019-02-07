class ActorsController < ApplicationController
  #collbacks
  before_action :find_actor_id, only: %i[show]
  def new
    @movie = Movie.find_by(id: params[:movie_id])
    @actor = @movie.actors.build
  end

  def show; end

  def create
    @movie = Movie.find_by(id: params[:movie_id])
    @actor = @movie.actors.build(actor_params)
    if @actor.save
      redirect_to manager_actor_path(current_manager, @actor)
    else
      render 'new'
    end
  end

  private

  def actor_params
    params.require('actor').permit(:name, :role)
  end

  def find_actor_id
    @actor = Actor.find_by(id: params[:id])
  end
end
