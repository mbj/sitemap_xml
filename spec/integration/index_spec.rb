require 'spec_helper'

describe 'sitemap index' do
  subject { SitemapXML.index(entries) }

  def entry(attributes)
    SitemapXML::Sitemap.new(attributes)
  end

  let(:entries) do
    [
      entry(
        :location          => 'http://www.example.com/sitemap1.xml.gz',
        :last_modification => DateTime.parse('2004-10-01T18:23:17+00:00').to_time,
      ),
      entry(
        :location         => 'http://www.example.com/sitemap2.xml.gz',
      )
    ]
  end

  context 'with items' do
    it 'should equal expectation' do
      compress(subject.split('><').join(">\n<")).should eql(compress(<<-XML))
        <?xml version="1.0" encoding="UTF-8"?>
        <sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
          <sitemap>
            <loc>http://www.example.com/sitemap1.xml.gz</loc>
            <lastmod>2004-10-01T18:23:17+00:00</lastmod>
          </sitemap>
          <sitemap>
            <loc>http://www.example.com/sitemap2.xml.gz</loc>
          </sitemap>
        </sitemapindex>
      XML
    end
  end
end
