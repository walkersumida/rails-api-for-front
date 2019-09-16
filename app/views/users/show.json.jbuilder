# frozen_string_literal: true

json.partial! 'users/user', user: (@user || current_user)
