module SitemapXML
  class Generator

    # Generator for sitemap index 
    class Index < self
      PRESENTER = Presenter::Sitemap

      # Enumerate chunks of data
      #
      # @api private
      #
      def each
        return to_enum unless block_given?

        yield '<?xml version="1.0" encoding="UTF-8"?>'
        yield '<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
        input.each do |item|
          yield xml(item)
        end
        yield '</sitemapindex>' 
      end

    end
  end
end
