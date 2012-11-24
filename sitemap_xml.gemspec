# -*- encoding: utf-8 -*-

require File.expand_path('../lib/sitemap_xml/version.rb', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'sitemap_xml'
  gem.version     = SitemapXML::VERSION.dup
  gem.authors     = [ 'Markus Schirp' ]
  gem.email       = [ 'mbj@seonic.net' ]
  gem.description = 'Sitemap XML generator'
  gem.summary     = gem.description
  gem.homepage    = 'https://github.com/mbj/sitemap_xml'

  gem.require_paths    = [ 'lib' ]
  gem.files            = `git ls-files`.split("\n")
  gem.test_files       = `git ls-files -- spec`.split("\n")
  gem.extra_rdoc_files = %w[TODO]
  
  gem.add_runtime_dependency('adamantium',          '~> 0.0.3')
  gem.add_runtime_dependency('equalizer',           '~> 0.0.1')
  gem.add_runtime_dependency('abstract_class',      '~> 0.0.1')
  gem.add_runtime_dependency('nokogiri',            '~> 1.5.0')
end
