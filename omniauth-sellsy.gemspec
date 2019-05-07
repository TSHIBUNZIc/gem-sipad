require File.expand_path('../lib/omniauth-sellsy/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "omniauth-sellsy"
  spec.version       = Omniauth::Sellsy::VERSION
  spec.authors       = ["Rémi Delhaye"]
  spec.email         = ["remi@xenoapp.com"]

  spec.summary       = %q{OmniAuth strategy for Sellsy.}
  spec.description   = %q{OmniAuth strategy for Sellsy.}
  spec.homepage      = "https://github.com/xenoapp/omniauth-sellsy"
  spec.license       = "MIT"

  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.files         = `git ls-files`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency 'omniauth', '~> 1.0'
  spec.add_dependency 'omniauth-oauth2', '~> 1.0'
end
