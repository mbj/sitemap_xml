module SitemapXML

  # Sitemap index entry
  class Sitemap
    include Anima, Adamantium

    attribute :location
    attribute :last_modification, DefaultNil

    include Equalizer.new(*attribute_set.map(&:name))

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
    # @param [String]
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
