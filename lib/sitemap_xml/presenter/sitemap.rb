module SitemapXML
  class Presenter

    # Presenter for sitemap index entries
    class Sitemap < self

      OPTIONAL = [:lastmod].freeze

      # Return xml
      #
      # @return [String]
      #
      # @api private
      #
      def xml
        Nokogiri::XML::Builder.new do |xml|
          xml.sitemap do
            xml.loc(location)
            value = lastmod
            if value
              xml.lastmod(value)
            end
          end
        end.doc.root.to_xml
      end

    end
  end
end
