require 'spec_helper'

describe 'sitemap index' do

  def entry(attributes)
    SitemapXML::Sitemap.new(attributes)
  end

  let(:entries) do
    [
      entry(
        :location          => 'http://www.example.com/sitemap1.xml.gz',
        :last_modification => DateTime.parse('2004-10-01T18:23:17+02:00'),
      ),
      entry(
        :location         => 'http://www.example.com/sitemap2.xml.gz',
      )
    ]
  end

  let(:xml) do 
    <<-XML
      <?xml version="1.0" encoding="UTF-8"?>
      <sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
        <sitemap>
          <loc>http://www.example.com/sitemap1.xml.gz</loc>
          <lastmod>2004-10-01T18:23:17+02:00</lastmod>
        </sitemap>
        <sitemap>
          <loc>http://www.example.com/sitemap2.xml.gz</loc>
        </sitemap>
      </sitemapindex>
    XML
  end

  context 'generation' do
    subject { SitemapXML.index(entries) }

    it 'should equal expectation' do
      compress(subject.split('><').join(">\n<")).should eql(compress(xml))
    end
  end

  context 'parseing' do
    subject { SitemapXML::Index.parse(compress(xml)) }

    it 'should equal expectation' do
      should eql(SitemapXML::Index.new(:sitemaps => entries))
    end
  end
end
