module SitemapXML

  # Presenter for entries
  class Presenter
    include Immutable

    # Convert entry to xml
    #
    # @param [Entry] entry
    #
    # @return [String] 
    #
    # @api private
    #
    def self.xml(entry)
      new(entry).xml
    end

    OPTIONAL = %w(
      lastmod
      changefreq
      priority
    ).deep_freeze

    # Return location
    #
    # @return [String]
    #
    # @api private
    #
    def location
      URI.escape(@entry.location)
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
      last_modification = @entry.last_modification

      case last_modification
      when NilClass
        return
      when Time
        last_modification.utc.strftime('%Y-%m-%dT%H:%M:%S+00:00')
      when Date
        last_modification.strftime('%Y-%m-%d')
      else
        raise
      end
    end
    memoize :lastmod

    # Return changefreq
    #
    # @return [String]
    #
    # @api private
    #
    def changefreq
      change_frequency = @entry.change_frequency

      return unless change_frequency

      change_frequency.to_s
    end

    # Return priority
    #
    # @return [String]
    #   if present
    #
    # @return [nil}
    #   otherwise
    #
    def priority
      priority = @entry.priority

      return unless priority

      return priority.to_s
    end

    # Return xml
    #
    # @return [String]
    #
    # @api private
    #
    def xml
      Nokogiri::XML::Builder.new do |xml|
        xml.url do
          xml.loc(location)
          OPTIONAL.each do |name|
            value = public_send(name)
            if value
              xml.send(name, value)
            end
          end
        end
      end.doc.root.to_xml
    end

  private

    # Initialize presenter
    #
    # @param [Entry] entry
    #
    # @api private
    #
    def initialize(entry)
      @entry = entry
    end
  end
end
