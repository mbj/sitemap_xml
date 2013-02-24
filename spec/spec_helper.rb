$: << 'lib'

require 'sitemap_xml'
require 'devtools'
Devtools.init_spec_helper

RSpec.configure do |config|
  config.extend(LetMockHelper)
  config.include(HTMLHelper)
end
