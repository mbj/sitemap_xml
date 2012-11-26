module SitemapXML
  class Generator

    # Generator for sitemap index 
    class Index < self
      PRESENTER = Presenter::Sitemap

      HEADER = [
        '<?xml version="1.0" encoding="UTF-8"?>',
        '<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
      ].join("\n").freeze

      FOOTER = '</sitemapindex>'.freeze
    end
  end
end
