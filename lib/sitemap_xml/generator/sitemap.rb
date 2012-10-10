module SitemapXML
  class Generator

    # Generator for sitemap xml 
    class Sitemap < self
      PRESENTER = Presenter::URL

      # Enumerate chunks of data
      #
      # @api private
      #
      def each
        return to_enum unless block_given?

        yield '<?xml version="1.0" encoding="UTF-8"?>'
        yield '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
        input.each do |item|
          yield xml(item)
        end
        yield '</urlset>' 
      end
    end
  end
end
