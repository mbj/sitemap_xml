module SitemapXML

  # Sitemap index entry
  class Sitemap
    include Adamantium::Flat, Anima.new(:location, :last_modification)

    # Convert node to sitemap
    #
    # @param [XML::Node] node
    #
    # @return [Entry]
    #
    # @api private
    #
    def self.from_node(node)
      xml = XML.new(node)

      new(
        :location          => xml.location,
        :last_modification => xml.last_modification
      )
    end

    # Parse input to urls
    #
    # @param [String] input
    #
    # @return [Enumerable<URL>]
    #
    # @api private
    #
    def self.parse(input)
      XML.parse(input).xpath('/xmlns:urlset/xmlns:url').map do |node|
        URL.from_node(node)
      end
    end

  end
end
