class ProfilesController < ApplicationController
  #collback
  before_action :find_profile_id, only: %i[show]
  
  def new
    @profile = current_manager.build_profile
  end

  def show; end

  def create
    @profile = current_manager.build_profile(profile_params)
    if @profile.save
      redirect_to manager_profile_path(current_manager, @profile)
    else
      render 'new'
    end
  end


  private
  def profile_params
    params.require('profile').permit(:name, :contact, :address)
  end

  def find_profile_id
    @profile = Profile.find_by(id: params[:id])
  end
end
