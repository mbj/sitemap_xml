module SitemapXML
  # Generator for sitemap xml 
  class Generator
    include Immutable

    # Write chunks to io
    #
    # @param [IO] io
    #
    # @return [self]
    #
    # @api private
    #
    def write(io)
      each do |chunk|
        io << chunk
      end

      self
    end

    # Enumerate chunks of data
    #
    # @api private
    #
    def each
      return to_enum unless block_given?

      yield '<?xml version="1.0" encoding="UTF-8"?>'
      yield '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
      @entries.each do |entry|
        yield Presenter.xml(entry)
      end
      yield '</urlset>' 
    end

  private

    # Initialize object
    #
    # @param [Entries] entries
    #
    # @return [undefined]
    #
    # @api private
    #
    def initialize(entries)
      @entries = entries
    end
  end
end
