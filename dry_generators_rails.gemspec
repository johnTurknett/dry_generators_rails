$:.push File.expand_path("lib", __dir__)

require "dry_generators_rails/version"

Gem::Specification.new do |spec|
  spec.name        = "dry_generators_rails"
  spec.version     = DryGeneratorsRails::VERSION
  spec.authors     = ["John Turknett"]
  spec.email       = ["johnturknett@gmail.com"]
  spec.homepage    = "https://github.com/johnTurknett/dry_generators_rails"
  spec.summary     = "dry-rb generators for Rails"
  spec.description = "Generate dry-rb classes for Rails applications"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.2", ">= 6.0.2.1"

  spec.add_development_dependency "sqlite3"
end
