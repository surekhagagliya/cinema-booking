class WelcomesController < ApplicationController
  before_action :authenticate_manager!
  def index
    @movies = Movie.all
  end
end
