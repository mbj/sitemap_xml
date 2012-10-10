module SitemapXML

  # Sitemap index entry
  class Sitemap
    include Anima, Immutable

    attribute :location
    attribute :last_modification, DefaultNil

    include Equalizer.new(attribute_set.map(&:name))
  end
end
