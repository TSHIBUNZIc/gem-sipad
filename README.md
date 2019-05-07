# omniauth-sellsy

This is the OmniAuth strategy for authenticating to [Sellsy](https://sellsy.com) (Using OAuth1)

## Installation

1. Create a Sellsy account on https://sellsy.com

2. To get access to the API and has to start develop your application, you must go into your account preferences Sellsy. You will find a category 'Developers'.

3. On this page you can manage your applications: creation, modification, and management of tokens access level (public / private).

4. You just have to create a new application. You will get your tokens and can start your development.

5. Add `omniauth-sellsy` to your Gemfile

   ```
   gem 'omniauth-sellsy'
   ```

6. Provide your Client ID and Client Secret to your gem in an initializer

   ```ruby
   # In config/initializers/omniauth.rb

   use OmniAuth::Builder do
     provider :sellsy, ENV['consumer_token'], ENV['consumer_secret']
   end
   ```

## Credits

This gem was authored by [Rémi Delhaye](https://xenoapp.com/).

## License

**MIT License**

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
