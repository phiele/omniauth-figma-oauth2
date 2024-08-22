lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "omniauth-figma-oauth2/version"

Gem::Specification.new do |spec|
  spec.name = "omniauth-figma-oauth2"
  spec.version = Omniauth::FigmaOauth2::VERSION
  spec.authors = ["Philipp Riedel"]
  spec.email = ["riedel.philipp@gmx.net"]
  spec.summary = "Figma OAuth2 strategy for OmniAuth"
  spec.description = "Figma OAuth2 strategy for OmniAuth"
  spec.homepage = "https://github.com/phiele/omniauth-figma-oauth2"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # # Specify which files should be added to the gem when it is released.
  # # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir['lib/**/*.rb'] + Dir['bin/*']
  spec.files += Dir['[A-Z]*']
  spec.files.reject! { |fn| fn.include? "CVS" }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  # Register dependencies for this gem
  spec.add_dependency "omniauth-oauth2", "~> 1.8"
  spec.add_dependency "omniauth", "~> 2.1"

  # Add development dependencies
  spec.add_development_dependency "bundler", "~> 2.4", ">= 2.4.20"
  spec.add_development_dependency "rake", "~> 13.2", ">= 13.2.1"
  spec.add_development_dependency "rspec", "~> 3.1", ">= 3.1.2"
  spec.add_development_dependency "rack-test", "~> 2.1.0"
  spec.add_development_dependency "simplecov", "~> 0.22.0"
  spec.add_development_dependency "webmock", "~> 3.23.1"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
