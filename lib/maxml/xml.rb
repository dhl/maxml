require 'open-uri'
require 'nori'
require 'json'
require 'maxml/mongo_persistence'

module MaxML
  class XML
    attr_reader :url, :date
    attr_accessor :db

    def initialize(url, db=MongoPersistence, **db_conf)
      @url = url
      @date = Time.now
      @content = self.class.fetch_content(url)
      @db = db.new
      db_config(db_conf) unless db_conf.empty?
    end

    def to_s
      @content
    end

    def to_json
      to_hash.to_json
    end

    def to_hash
      parser = Nori.new
      parser.parse(@content)
    end

    def save
      content = block_given? ? yield(to_hash) : to_hash
      @db.save({url: @url, date: @date, content: content})
    end

    def db_config(opts)
      @db.config = opts
    end

    def self.fetch_content(url)
      uri = URI.parse(url)
      uri.read
    end

  end
end
