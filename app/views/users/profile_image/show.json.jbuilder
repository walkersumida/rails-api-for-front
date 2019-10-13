# frozen_string_literal: true

json.partial! 'users/profile_image/user', user: (@user || current_user)
