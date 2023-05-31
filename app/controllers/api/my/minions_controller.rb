class Api::My::MinionsController < ApplicationController
  before_action :authenticate
  before_action :set_minion, only: %i[ show update destroy ]

  # GET /minions
  def index
    @minions = @current_user.minions

    render json: @minions
  end

  # GET /players/1
  def show
    if @current_user.minions.include?(@minion)
      render json: @minion
    else
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end

  # PATCH/PUT /minions/1
  def update
    if @minion.update(minion_params)
      render json: @minion
    else
      render json: @minion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /minions/1
  def destroy
    @minion.player_id = nil
    @minion.save
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_minion
    @minion = current_player.minions.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def minion_params
    params.require(:minion).permit(:name, :status, :player_id)
  end
end
