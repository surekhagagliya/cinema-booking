class VotesController < ApplicationController
  #collbacks
  before_action :find_vote_id, only: %i[show]
  before_action :find_movie, only: %i[new create ]

  def index
    @vote = Vote.all
  end
  def new
    @vote = @movie.votes.build
  end

  def show; end

  def create
    @vote = @movie.votes.build(vote_params)
    if @vote.save
      redirect_to manager_movie_vote_path(current_manager, @movie, @vote)
    else
      render 'new'
    end
  end

  private

  def vote_params
    params.require('vote').permit(:per_votes)
  end

  def find_vote_id
    @vote = Vote.find_by(id: params[:id])
  end

  def find_movie
    @movie = Movie.find_by(id: params[:movie_id])
  end
end
