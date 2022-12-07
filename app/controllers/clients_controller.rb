class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_not_found

  def show
    client = Client.find(params[:id])
    render json: client, status: :ok
  end

  private 

  def render_not_found(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
