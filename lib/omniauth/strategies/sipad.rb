# require "omniauth/strategies/oauth"
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Sipad  < OmniAuth::Strategies::OAuth2
      # include OmniAuth::Strategy
      option :name, "sipad"
      # definir nos arguments

      option :client_options, {
        site: ENV['url_provider'],
        raw_info_url: '/my/profile.json', #
        # request_token_path: '/0/request_token',
        # access_token_path: '/0/access_token',
        # authorize_path: '/0/login.php'
        authorize_path: '/users/sign_in'
      }

      option :pkce, true

      info do
        {
          id:         raw_info['id'],
          name:       "#{raw_info['surname']} #{raw_info['firstname']}" ,
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
        @raw_info ||= access_token.get(options['client_options']['raw_info_url']).parsed
        # @raw_info ||= JSON.parse(access_token.post(options['client_options']['raw_info_url'], { 'do_in' => {
        #   'method' => 'Infos.getInfos',
        #   'params' => []
        # }.to_json,
        # 'io_mode' => 'json',
        # 'request' => 1
        # }).body)['response']['userdatas']

      end
    end
  end
end