module SitemapXML
  # Sitemap index
  class Index
    include Anima, Adamantium::Flat

    attribute :sitemaps

    equalize_on_attributes

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
