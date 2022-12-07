class GymsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_status_code
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def show
    gym = Gym.find(params[:id])
    render json: gym, status: :ok
  end

  def destroy
    gym = Gym.find(params[:id])
    gym.destroy
    head :no_content
  end

  private

  def render_status_code(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

  def render_not_found
    render json: { error: "Gym not found"}, status: :not_found 
  end
end
