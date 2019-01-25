require 'omniauth/strategies/oauth2'
require 'json'

module OmniAuth
  module Strategies
    class OpenGuilds < OmniAuth::Strategies::OAuth2
      option :name, 'open_guilds'

      option :client_options, {
        :authorize_path => '/oauth/authenticate',
        :site => 'https://dashboard.openguilds.com',
      }

      uid { access_token.params[:id] }


      info do
        {
          :name => raw_info['name'],
          :email => raw_info['email'],
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('api/me').parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end

    autoload :OpenGuilds, "omniauth/strategies/open_guilds"
  end
end
