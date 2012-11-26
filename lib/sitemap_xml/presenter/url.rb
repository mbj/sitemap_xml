module SitemapXML
  class Presenter

    # Presenter for sitemap urls
    class URL < self

      OPTIONAL = %w(
        lastmod
        changefreq
        priority
      ).deep_freeze

      # Return changefreq
      #
      # @return [String]
      #
      # @api private
      #
      def changefreq
        change_frequency = input.change_frequency

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
      # @api private
      #
      def priority
        priority = input.priority

        return unless priority

        priority.to_s
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

    end
  end
end
