class ScreensController < ApplicationController
  #collbacks
  before_action :find_screen_id, only: %i[show edit update destroy]

  def index
    @screens = Screen.all
  end

  def new
    @screen = current_manager.screens.build
  end

  def show; end

  def create
    @screen = current_manager.screens.build(screen_params)
    if @screen.save
      redirect_to manager_screen_path(current_manager, @screen)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @screen.update(screen_params)
      redirect_to manager_screen_path(current_manager, @screen)
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to manager_screens_path(current_manager) if @screen.destroy
  end

  private

  def screen_params
    params.require('screen').permit(:name, :number)
  end

  def find_screen_id
    @screen  = Screen.find_by(id: params[:id])
  end
end
