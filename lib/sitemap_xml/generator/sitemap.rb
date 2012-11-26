module SitemapXML
  class Generator

    # Generator for sitemap xml 
    class Sitemap < self
      PRESENTER = Presenter::URL

      HEADER = [
        '<?xml version="1.0" encoding="UTF-8"?>',
        '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
      ].join("\n").freeze

      FOOTER = '</urlset>'.freeze
    end
  end
end
