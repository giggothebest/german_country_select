# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "german_country_select/version"

Gem::Specification.new do |s|
  s.name = "country_select"
  s.version = CountrySelect::VERSION
  s.authors = ["Christian Brunner"]
  s.email = ["christian.brunner@sti-consulting.de"]
  s.homepage = ""
  s.summary = %q{german Country Select Plugin}
  s.description = %q{Provides a simple helper to get an HTML select list of countries in german. The list of countries comes from the ISO 3166 standard. While it is a relatively neutral source of country names, it will still offend some users.}

  s.rubyforge_project = "country_select"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end