require 'spec_helper'

describe 'sitemap' do
  def entry(attributes)
    SitemapXML::URL.new(attributes)
  end

  let(:urls) do
    [
      entry(
        :location          => 'http://www.example.com/',
        :last_modification => Date.parse('2005-01-01'),
        :change_frequency  => 'monthly',
        :priority          => 0.8
      ),
      entry(
        :location          => 'http://www.example.com/catalog?item=12&desc=vacation_hawaii',
        :last_modification => nil,
        :change_frequency  => 'weekly',
        :priority          => nil
      ),
      entry(
        :location          => 'http://www.example.com/catalog?item=73&desc=vacation_new_zealand',
        :last_modification => Date.parse('2004-12-23'),
        :change_frequency  => 'weekly',
        :priority          => nil
      ),
      entry(
        :location          => 'http://www.example.com/catalog?item=74&desc=vacation_newfoundland',
        :last_modification => DateTime.parse('2004-12-23T18:00:15+01:00'),
        :change_frequency  => nil,
        :priority          => 0.3
      ),
      entry(
        :location          => 'http://www.example.com/catalog?item=83&desc=vacation_usa',
        :last_modification => Date.parse('2004-11-23'),
        :change_frequency  => nil,
        :priority          => nil
      )
    ]
  end

  let(:xml) do
    <<-XML
      <?xml version="1.0" encoding="UTF-8"?>
      <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
         <url>
            <loc>http://www.example.com/</loc>
            <lastmod>2005-01-01</lastmod>
            <changefreq>monthly</changefreq>
            <priority>0.8</priority>
         </url>
         <url>
            <loc>http://www.example.com/catalog?item=12&amp;desc=vacation_hawaii</loc>
            <changefreq>weekly</changefreq>
         </url>
         <url>
            <loc>http://www.example.com/catalog?item=73&amp;desc=vacation_new_zealand</loc>
            <lastmod>2004-12-23</lastmod>
            <changefreq>weekly</changefreq>
         </url>
         <url>
            <loc>http://www.example.com/catalog?item=74&amp;desc=vacation_newfoundland</loc>
            <lastmod>2004-12-23T18:00:15+01:00</lastmod>
            <priority>0.3</priority>
         </url>
         <url>
            <loc>http://www.example.com/catalog?item=83&amp;desc=vacation_usa</loc>
            <lastmod>2004-11-23</lastmod>
         </url>
      </urlset>
    XML
  end

  context 'generating' do
    subject { SitemapXML.generate(urls) }

    it 'should equal expectation' do
      compress(subject.split('><').join(">\n<")).should eql(compress(xml))
    end
  end

  context 'parseing' do
    subject { SitemapXML::Sitemap.parse(compress(xml)) }

    it 'should equal expectation' do
      should eql(urls)
    end
  end
end
