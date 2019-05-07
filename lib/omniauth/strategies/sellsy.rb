require "omniauth/strategies/oauth"

module OmniAuth
  module Strategies
    class Sellsy < OmniAuth::Strategies::OAuth
      args [:consumer_key, :consumer_secret]

      option :client_options, {
        site: 'https://apifeed.sellsy.com',
        raw_info_url: 'https://apifeed.sellsy.com/0/',
        request_token_path: '/0/request_token',
        access_token_path: '/0/access_token',
        authorize_path: '/0/login.php'
      }

      credentials do
        {
          token:  access_token.token,
          secret: access_token.secret
        }
      end

      info do
        {
          id:         raw_info['peopleid'],
          first_name: raw_info['forename'],
          last_name:  raw_info['name'],
          full_name:  raw_info['fullName'],
          language:   raw_info['uilang'],
          type:       raw_info['userType'],
          email:      raw_info['mail'],
          phone:      raw_info['tel'],
          company:    {
            id:   raw_info['corpInfos']['id'],
            name: raw_info['corpInfos']['name']
          }
        }
      end

      uid { raw_info['peopleid'] }

      extra do
        {
          raw_info: raw_info
        }
      end

      private

      def raw_info
        @raw_info ||= JSON.parse(access_token.post(options['client_options']['raw_info_url'], { 'do_in' => {
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
