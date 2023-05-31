class Api::MinionsController < ApplicationController
  before_action :set_minion, only: %i[ show update destroy ]

  # GET /minions
  def index
    @minions = Minion.all

    render json: @minions
  end

  # GET /minions/1
  def show
    render json: @minion
  end

  # POST /minions
  def create
    @minion = Minion.new(minion_params)

    if @minion.save
      render json: @minion, status: :created
    else
      render json: @minion.errors, status: :unprocessable_entity
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
    @minion.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minion
      @minion = Minion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def minion_params
      params.require(:minion).permit(:name, :status, :player_id)
    end
end
