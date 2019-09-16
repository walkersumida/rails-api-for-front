# frozen_string_literal: true

class UsersController < AuthenticatedController
  before_action :set_user, only: %i(show)

  def show
    # noop
  end

  def update
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

  def set_user
    @user = User.find_by!(uuid: user_uuid)
  end

  def user_params
    params.require(:user).permit(:nickname)
  end
end
