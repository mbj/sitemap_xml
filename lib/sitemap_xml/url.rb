module SitemapXML

  # URL sitemap entry
  class URL
    include Anima, Immutable

    attribute :location
    attribute :last_modification, DefaultNil
    attribute :change_frequency,  DefaultNil
    attribute :priority,          DefaultNil

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
        :last_modification => xml.last_modification,
        :change_frequency  => xml.change_frequency,
        :priority          => xml.priority
      )
    end
  end
end
