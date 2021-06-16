# require "omniauth/strategies/oauth"
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Sipad  < OmniAuth::Strategies::OAuth2
      # include OmniAuth::Strategy
      args [:consumer_key, :consumer_secret]
      # definir nos arguments

      option :client_options, {
        site: 'https://www.sipadconnect.fr',
        # raw_info_url: 'https://apifeed.sellsy.com/0/', #
        # request_token_path: '/0/request_token',
        # access_token_path: '/0/access_token',
        # authorize_path: '/0/login.php'
        authorize_path: '/users/sign_in'
      }

      credentials do
        {
          token:  access_token.token,
          secret: access_token.secret
        }
      end

      info do
        {
          id:         raw_info['id'],
          name:       "#{raw_info['surname']} #{raw_info['first_name']}" ,
          email:      raw_info['email'],
          home_phone:      raw_info['phone_number']
        }
      end

      uid { raw_info['id'] }

      extra do
        {
          raw_info: raw_info
        }
      end

      private

      def raw_info
        @raw_info ||= JSON.parse(access_token.post(options[':users']['raw_info_url'], { 'do_in' => {
            'method' => 'Infos.getInfos',
            'params' => []
          }.to_json,
          'io_mode' => 'json',
          'request' => 1
        }).body)['response']['userdatas']
      end
    end
  end
end