$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "liquid_cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "liquid_cms"
  s.version     = LiquidCms::VERSION
  s.authors     = ["Sergei O. Udalov"]
  s.email       = ["sergei.udalov@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "CMS Liquid with liquid."
  s.description = "TODO: Description of LiquidCms."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"
  s.add_dependency "liquid"
  s.add_dependency "browser"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
