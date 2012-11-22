module SitemapXML

  # Abstract base class for presenter
  class Presenter
    include AbstractClass, Adamantium::Flat, Equalizer.new(:input)

    # Convert input to xml
    #
    # @param [Object] entry
    #
    # @return [String] 
    #
    # @api private
    #
    def self.xml(input)
      new(input).xml
    end

    # Return input
    #
    # @return [Object]
    #
    # @api private
    attr_reader :input

    # Return location
    #
    # @return [String]
    #
    # @api private
    #
    def location
      URI.escape(input.location)
    end
    memoize :location

    # Return lastmod
    #
    # @return [String]
    #   if present
    #
    # @return [nil]
    #   otherwise
    #
    # @api private
    #
    def lastmod
      last_modification = input.last_modification

      case last_modification
      when NilClass
        return
      when Time, DateTime
        last_modification.strftime('%Y-%m-%dT%H:%M:%S%:z')
      when Date
        last_modification.strftime('%Y-%m-%d')
      else
        raise
      end
    end
    memoize :lastmod

  private

    # Initialize presenter
    #
    # @param [Object] input
    #
    # @api private
    #
    def initialize(input)
      @input = input
    end
  end
end
