require File.expand_path('../lib/omniauth-sipad/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "omniauth-sipad"
  spec.version       = Omniauth::Sipad::VERSION
  spec.authors       = ["TSHIBUNZI Cippora"]
  spec.email         = ["tshibunzi@gmail.com"]

  spec.summary       = %q{OmniAuth strategy for Sipad.}
  spec.description   = %q{OmniAuth strategy for Sipad.}
  spec.license       = "MIT"

  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.files         = `git ls-files`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"

  # spec.add_dependency 'omniauth', '~> 1.0'
  spec.add_dependency 'omniauth-oauth2', '~> 1.2'
end
