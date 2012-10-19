module SitemapXML
  # Sitemap index
  class Index
    include Anima, Adamantium

    attribute :sitemaps

    include Equalizer.new(*attribute_set.map(&:name))

    # Return xml
    #
    # @return [String]
    #
    # @api private
    #
    def xml
      Generator::Index.generate(sitemaps)
    end
    memoize :xml


    # Parse input to index
    #
    # @param [String]
    #
    # @api private
    #
    def self.parse(input)
      sitemaps = XML.parse(input).xpath('/xmlns:sitemapindex/xmlns:sitemap').map do |node|
        Sitemap.from_node(node)
      end
      new(:sitemaps => sitemaps)
    end

  end
end
