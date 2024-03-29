# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "AdminSpace"
  gem.version       = '0.0.3'
  gem.authors       = ["Thomas Lauro"]
  gem.email         = ["thomas@lauro.fr"]
  gem.description   = %q{AdminSpace handle admin namespace for you}
  gem.summary       = %q{AdminSpace handle admin namespace for you}
  gem.homepage      = "http://github.com/frozon/admin_space"

  gem.files         = Dir.glob('{app,config,lib}/**/*') + %w(Gemfile LICENSE.txt README.md Rakefile)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'haml'
  gem.add_dependency 'sass-rails'
end
