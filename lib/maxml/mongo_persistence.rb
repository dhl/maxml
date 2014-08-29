require 'mongo'
require 'maxml/errors'
module MaxML
  class MongoPersistence
    include Mongo

    attr_reader :config

    DEFAULT_CONFIG = {
      :host => "localhost",
      :port => 27017
    }.freeze

    def initialize
      @config = DEFAULT_CONFIG.dup
    end

    def config=(opts)
      conf = DEFAULT_CONFIG.merge(opts)
      self.class.validate_config(conf)
      @config = conf
    end

    def save(hash)
      self.class.validate_config(@config)
      client = MongoClient.new(@config[:host], @config[:port])
      db     = client.db(@config[:database])
      coll   = db.collection(@config[:collection])

      coll.insert(hash)
    end

    def self.validate_config(opts)
      raise Errors::InvalidConfig unless opts.is_a? Hash

      required_keys = [:host, :port, :database, :collection]
      required_keys.each do |key|
        unless opts.has_key?(key)
          raise Errors::InvalidConfigOption.new(key)
        end
      end
    end

  end # class MongoPersistence
end # module MaxML
