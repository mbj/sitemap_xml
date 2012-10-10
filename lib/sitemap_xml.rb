require 'immutable'
require 'equalizer'
require 'anima'
require 'nokogiri'
require 'uri'
require 'ice_nine'
require 'ice_nine/core_ext/object'

# Library namespace
module SitemapXML

  # Anima attribute that defaults to nil
  class DefaultNil < ::Anima::Attribute
    DEFAULT = ::Anima::Default::Value.new(nil)
  end

  # Generate sitemap as a blob
  #
  # @param [Enumerable<URL>] urls
  #
  # @return [String]
  #
  # @api private
  #
  def self.generate(urls)
    Generator::Sitemap.generate(urls)
  end

  # Generate sitemap index as a blob
  #
  # @param [Enumerable<Sitemap>] sitemaps
  #
  # @return [String]
  #
  # @api private
  #
  def self.index(sitemaps)
    Generator::Index.generate(sitemaps)
  end
end

require 'sitemap_xml/url'
require 'sitemap_xml/sitemap'
require 'sitemap_xml/presenter'
require 'sitemap_xml/presenter/sitemap'
require 'sitemap_xml/presenter/url'
require 'sitemap_xml/generator'
require 'sitemap_xml/generator/sitemap'
require 'sitemap_xml/generator/index'
