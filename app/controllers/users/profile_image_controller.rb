# frozen_string_literal: true

class Users::ProfileImageController < AuthenticatedController
  def create
    if current_user.update(user_params)
      render :show
    else
      render json: current_user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_uuid
    params[:uuid] == 'me' ? current_user.uuid : params[:uuid]
  end

  def user_params
    params.permit(:image)
  end
end
