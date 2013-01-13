$: << 'lib'

require 'sitemap_xml'

# require spec support files and shared behavior
Dir[File.expand_path('../{support,shared}/**/*.rb', __FILE__)].each { |f| require f }

if RUBY_VERSION < '1.9.0'
  require 'rspec/autorun'
end

RSpec.configure do |config|
  config.extend(LetMockHelper)
  config.include(HTMLHelper)
end
