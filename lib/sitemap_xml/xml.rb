module SitemapXML

  # XML decorator
  class XML
    include Adamantium

    # Return location
    #
    # @return [String]
    #
    # @api private
    #
    def location
      ::URI.unescape(one('./xmlns:loc').text)
    end
    memoize :location

    # Return priority
    #
    # @return [Float]
    #   if present
    #
    # @return [nil]
    #   otherwise
    #
    # @api private
    #
    def priority
      node = one_or_nil('./xmlns:priority')
      node && node.text.to_f
    end
    memoize :priority

    # Return change frequency
    #
    # @return [String]
    #   if present
    #
    # @return [nil]
    #   otherwise
    #
    # @api private
    #
    def change_frequency
      node = one_or_nil('./xmlns:changefreq')
      node && node.text
    end
    memoize :change_frequency

    # Return last_modification
    #
    # @return [Date]
    #   if date
    #
    # @return [DateTime]
    #   if datetime
    #
    # @return [nil]
    #   if not present
    #
    def last_modification
      lastmod = one_or_nil('./xmlns:lastmod')
      return unless lastmod

      text = lastmod.text

      date = Date.parse(text)
      datetime = DateTime.parse(text)

      if text == date.to_s
        date
      else
        datetime
      end
    end
    memoize :last_modification

  private

    # Find exactly one element
    #
    # @param [String] xpath
    #
    # @return [XML::Node]
    #   if found
    #
    # @raise [RuntimeError]
    #   otherwise
    #
    def one(xpath)
      elements = node.xpath(xpath)
      unless elements.size == 1
        raise "Expected one element for: #{xpath.inspect} got: #{elements.size}"
      end
      elements.first
    end

    # Find exactly one element
    #
    # @param [String] xpath
    #
    # @return [XML::Node]
    #   if found
    #
    # @raise [RuntimeError]
    #   otherwise
    #
    def one_or_nil(xpath)
      elements = node.xpath(xpath)
      if elements.size > 1
        raise "Expected one or zero element for: #{xpath.inspect} got: #{elements.size}"
      end
      elements.first
    end

    # Return node
    #
    # @return [XML::Node]
    #
    # @api private
    #
    attr_reader :node

    # Initialize object
    #
    # @param [XML::Node] node
    #
    # @return [undefined]
    #
    # @api private
    #
    def initialize(node)
      @node = node
    end

    # Parse xml 
    #
    # @param [String] input
    #
    # @api private
    #
    def self.parse(input)
      Nokogiri::XML::Document.parse(input) do |conf|
        conf.nonet
      end
    end

  end
end
