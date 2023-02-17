class ActivitiesController < ApplicationController

  #GET all activities
  def index
    @activities = Activity.all 
  end

  #GET request to create new activity
  def new
    @activity = Activity.new 
  end

  def create
  end

  def edit
  end

  def show
  end

  def destroy
  end
end
