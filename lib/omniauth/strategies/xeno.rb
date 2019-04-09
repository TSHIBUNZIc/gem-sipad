require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Xeno < OmniAuth::Strategies::OAuth2
      option :name, :xeno

      option :client_options, {
        site: 'https://xeno.app',
        authorize_url: 'https://xeno.app/oauth/authorize',
        token_url: 'https://xeno.app/oauth/token'
      }

      option :authorize_options, [:scope]

      def request_phase
        super
      end

      def callback_phase
        super
      end

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end

      uid { raw_info['uid'].to_s }

      info do
        {
          username: raw_info['username'],
          firstname: raw_info['firstname'],
          lastname: raw_info['lastname'],
          email: raw_info['email'],
          image: raw_info['image'],
          admin: raw_info['admin'],
          team: {
            uid: raw_info['team']['uid'],
            name: raw_info['team']['name'],
            image: raw_info['team']['image']
          }
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/api/me").parsed
      end
    end
  end
end
