# https://github.com/lynndylanhurley/devise_token_auth/wiki/Testing-(with-Rspec)
module Requests
  module AuthHelpers
    module Extensions
      def sign_in(user)
        let(:auth_helpers_auth_token) do
          public_send(user).create_new_auth_token
        end
      end
    end

    module Includables
      HTTP_HELPERS_TO_OVERRIDE =
        [:get, :post, :patch, :put, :delete].freeze
      # Override helpers for Rails 5.0
      # see http://api.rubyonrails.org/v5.0/classes/ActionDispatch/Integration/RequestHelpers.html
      HTTP_HELPERS_TO_OVERRIDE.each do |helper|
        define_method(helper) do |path, **args|
          add_auth_headers(args)
          args == {} ? super(path) : super(path, **args)
        end
      end

      private

      def add_auth_headers(args)
        return unless defined? auth_helpers_auth_token
        args[:headers] ||= {}
        args[:headers].merge!(auth_helpers_auth_token)
      end
    end
  end
end
