require 'spec_helper'
require 'webmock/rspec/matchers'

require "maxml/xml"
require 'json'
require 'mongo'

describe MaxML::XML do

  URL = "http://www.example.com/sitemap.xml".freeze
  XML_DOC = File.read("spec/fixtures/sample.xml").freeze

  let(:xml) { MaxML::XML.new(URL) }

  before(:each) do
    stub_request(:get, URL).to_return(:body => XML_DOC)
  end

  it "should fetch XML content from remote server on creation" do
    xml
    expect(a_request(:any, URL)).to have_been_requested.once
  end

  it "should convert XML to JSON" do
    # We can't be sure the JSON library used will always
    # generate the same JSON string. So let's parse it and
    # test the parsed object instead.
    json = JSON.parse(xml.to_json)

    feed = json["rss"]["channel"]

    expect(feed["title"]).to eq("XML Sitemaps RSS Feed")
    expect(feed["link"]).to eq("http://www.example.com/")
    expect(feed["description"]).to eq("Example.com - Feed")
    expect(feed["item"]["title"]).to eq("First Post")
  end

  it "should save the XML content to DB" do
    db = xml.db
    allow(db).to receive(:save)
    
    record = {:url => URL, :date => xml.date, :content => xml.to_hash}
    expect(db).to receive(:save).with(record)
    
    xml.save
  end

  it "should be able to update db config" do
    db = xml.db
    allow(db).to receive(:config=)
    db_spec = {:host => "example.com", :port => 1337}
    expect(db).to receive(:config=).with(db_spec)

    xml.db_config(db_spec)
  end

  it "implements to_s method to return the serialized XML document" do
    expect(xml.to_s).to eq(XML_DOC)
  end

end
