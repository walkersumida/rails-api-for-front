# frozen_string_literal: true

class UsersController < AuthenticatedController
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

  def user_params
    params.require(:user).permit(:nickname)
  end
end
