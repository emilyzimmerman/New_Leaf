class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[ show edit update destroy ]

  # GET /favorites or /favorites.json
  def index
    @favorites = Favorite.all
  end


  # POST /favorites or /favorites.json

  def create
    @favorite = helpers.current_user.favorites.new(favorite_params)
    respond_to do |format|
      if @favorite.save
        format.html { redirect_to favorites_url, notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @favorite }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end

  end
  
  # DELETE /favorites/1 or /favorites/1.json
  def destroy
    @activity = @favorite.activity
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_url, notice: "Favorite was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_params
      params.require(:favorite).permit(:user_id, :activity_id)
    end
  end