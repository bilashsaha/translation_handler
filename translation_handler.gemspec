$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "translation_handler/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "translation_handler"
  s.version     = TranslationHandler::VERSION
  s.authors     = ["Bilash Saha", "Abdul Barek"]
  s.email       = ["bilashsaha03@gmail.com","barek2k2@gmail.com"]
  s.homepage    = ""
  s.summary     = "A MVC based Rails Engine(gem) that manages translations from GUI"
  s.description = "It manages translations available from (config/locals/*.yml) through making customized views so that translation files can be managed from User Interface"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

end
