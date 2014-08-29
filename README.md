# MaxML

Download, parse and save an XML document to MongoDB

## Install

Make sure you're using {Bundler}[http://bundler.io].

Add `gem "maxml"` to your `Gemfile`.

As your project may depend on a particular version of the `mongo` and/or
`bson_ext` gem, you need to add those to your Gemfile as well.

```ruby
gem 'maxml'
gem 'mongo'
gem 'bson_ext' 
```

## Usage Example

```ruby
# DB defaults to "localhost" for `host` and 27017 for `port`
db_config = {database: "maxml_test", collection: "xmls"}
reddit = MaxML::XML.new("http://www.reddit.com/.rss", db_config)

# Parse the XML into a JSON string
reddit.to_json

# Parse the XML into a Ruby hash
reddit.to_hash

# Return the serialized XML string
reddit.to_s

# Save to DB
reddit.save

```
## Copyright and License

Copyright © 2014 David Leung

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
