module SitemapXML
  class Generator

    # Generator for sitemap xml 
    class Sitemap < self
      PRESENTER = Presenter::URL
      HEADER = IceNine.deep_freeze([
        '<?xml version="1.0" encoding="UTF-8"?>',
        '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
      ].join("\n"))
      FOOTER = '</urlset>'.freeze
    end
  end
end
