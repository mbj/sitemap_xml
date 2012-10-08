require 'immutable'
require 'equalizer'
require 'anima'
require 'nokogiri'
require 'uri'
require 'ice_nine'
require 'ice_nine/core_ext/object'

# Library namespace
module SitemapXML

  # Generate sitemap as a blob
  #
  # @param [Enumerable<Entry>] entries
  #
  # @return [String]
  #
  # @api private
  #
  def self.generate(entries)
    io = StringIO.new
    Generator.new(entries).write(io)
    io.rewind
    io.read
  end

end

require 'sitemap_xml/entry'
require 'sitemap_xml/presenter'
require 'sitemap_xml/generator'
