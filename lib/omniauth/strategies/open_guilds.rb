require 'omniauth'
require 'json'

module OmniAuth
  module Strategies
    class OpenGuilds
      include OmniAuth::Strategy
      option :name, :open_guilds

      option :client_options, {
        :authorize_path => '/oauth/authenticate',
        :site => 'https://dashboard.openguilds.com',
      }

      uid { access_token.params[:user_id] }


      info do
        {
          :name => raw_info['name'],
          :email => raw_info["email"],
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('api/v1/me').parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
