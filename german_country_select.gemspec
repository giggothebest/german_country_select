# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'german_country_select/version'

Gem::Specification.new do |g|
  g.name          = "german_country_select"
  g.version       = GermanCountrySelect::VERSION
  g.authors       = ["Christian Brunner"]
  g.email         = ["christian.brunner@sti-consulting.de"]
  g.description   = %q{german CountrySelect}
  g.summary       = %q{german CountrySelect}
  g.homepage      = ""

  #g.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  g.files         = `git ls-files`.split($/)
  g.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  g.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  # g.executables   = g.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  # g.test_files    = g.files.grep(%r{^(test|spec|features)/})
  g.require_paths = ["lib"]
end
