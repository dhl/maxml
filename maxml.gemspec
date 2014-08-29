Gem::Specification.new do |s|
  s.name        = "maxml"
  s.summary     = "Download, parse and save XML document to MongoDB"
  s.description = "MaxML is a utility that helps you to download and save " +
                  "XML documents straight to MongoDB."
  s.version     = "0.0.3"
  s.author      = "David Leung"
  s.email       = "david@davidslab.com"
  s.homepage    = "http://github.com/dhl/maxml"
  s.license     = "MIT"
  s.platform    = Gem::Platform::RUBY

  s.required_ruby_version = '>=1.9'

  s.add_runtime_dependency 'nori', '~> 2.4.0'
  s.add_runtime_dependency 'nokogiri', '~> 1.6.3.1'
  s.add_runtime_dependency 'mongo'

  s.files        = Dir['lib/**/*'] + %w{LICENSE README.md}
  s.test_files   = Dir["spec/**/*"]
  s.require_path = 'lib'
  s.has_rdoc     = false
end
