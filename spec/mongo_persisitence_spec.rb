require 'mongo'
include Mongo

describe MaxML::MongoPersistence do

  let (:db) { MaxML::MongoPersistence.new }

  DEFAULT_CONFIG = {
    :host => ENV["TEST_DB_HOST"] || "localhost",
    :port => ENV["TEST_DB_PORT"] || 27017
  }.freeze

  FULL_CONFIG = DEFAULT_CONFIG
    .merge({
             :database => 'maxml_testing',
             :collection => 'xmls',
             :username => 'user',
             :password => 'secret'
           }).freeze

  context "when initializing" do
    it "should be configured to connect to default host and port" do
      expect(db.config[:host]).to eq(DEFAULT_CONFIG[:host])
      expect(db.config[:port]).to eq(DEFAULT_CONFIG[:port])
    end
  end

  it "should accept configurations" do
    db.config = FULL_CONFIG
    conf = db.config
    expect(conf[:host]).to eq(DEFAULT_CONFIG[:host])
    expect(conf[:port]).to eq(DEFAULT_CONFIG[:port])
    expect(conf[:database]).to eq(FULL_CONFIG[:database])
    expect(conf[:collection]).to eq(FULL_CONFIG[:collection])
  end

  it "should save a hash to DB" do
    client  = MongoClient.new(FULL_CONFIG[:host], FULL_CONFIG[:port])
    test_db = client.db(FULL_CONFIG[:database])
    coll    = test_db.collection(FULL_CONFIG[:collection])
    coll.drop

    db.config = FULL_CONFIG
    db.save({:successful_save => true})

    expect(coll.find({:successful_save => true}).count).to eq(1)
  end

  it "should validate configuration when changing database settings"

  it "should validate configuration when saving"

end
