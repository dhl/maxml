Gem::Specification.new do |s|
  s.name        = "maxml"
  s.summary     = "Download, parse and save an XML document to MongoDB"
  s.description = File.read(File.join(File.dirname(__FILE__), 'README.md'))
  s.version     = "0.0.1"
  s.author      = "David Leung"
  s.email       = "david@davidslab.com"
  s.homepage    = "http://github.com/dhl/maxml"
  s.license     = "MIT"
  s.platform    = Gem::Platform::RUBY

  s.required_ruby_version = '>=1.9'

  s.files        = Dir['lib/**/*'] + %w{LICENSE README.md}
  s.test_files   = Dir["spec/**/*"]
  s.require_path = 'lib'
  s.has_rdoc     = false
end
