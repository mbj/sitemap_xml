module SitemapXML

  # URL sitemap entry
  class URL
    include Anima, Adamantium::Flat

    attribute :location
    attribute :last_modification, DefaultNil
    attribute :change_frequency,  DefaultNil
    attribute :priority,          DefaultNil

    equalize_on_attributes

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
