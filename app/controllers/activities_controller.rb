class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  before_action :require_same_creator, only: [:destroy, :edit]
  #GET all activities
  def index
    @activities = Activity.all 
  end

  #GET request to create new activity
  def new
    @activity = Activity.new 
  end

  def create
    @activity = helpers.current_user.activities.new(activity_params)

    if @activity.save
      flash[:notice] = "Activity successfully uploaded"
      redirect_to @activity
    else
      flash[:notice] = "There was an error"
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update 
   
    if @activity.update(activity_params)
      flash[:notice] = "Update Successful"
      redirect_to @activity
    else 
      flash[:notice] = "There was an error"
      render :edit, status: :unprocessable_entity
    end
  end

  def show

  end

  def destroy
    @activity.destroy
    redirect_to activities_path

  end

  def save
    helpers.current_user << @activity 
  end

  private 

  def require_same_creator
    if helpers.current_user != @activity.user
      flash[:notice] = "Unauthorized"
      redirect_to helpers.current_user
    end
  end

  def activity_params 
    params.require(:activity).permit(:name, :description, :image_path, category_ids: [])
  end

  def set_activity 
    @activity = Activity.find(params[:id])
  end
end
