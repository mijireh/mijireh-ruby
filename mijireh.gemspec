Gem::Specification.new do |s|
  s.name        = 'mijireh'
  s.version     = '0.0.1'
  s.date        = '2010-04-28'
  s.summary     = "Ruby library for the Mijireh e-Commerce platform"
  s.description = "Mijireh is changing the world of e-Commerce.  See http://mijireh.com for more details."
  s.authors     = ["Joey Beninghove"]
  s.email       = 'joey@mijireh.com'
  s.homepage    = 'http://rubygems.org/gems/mijireh'

  s.add_dependency('rest-client', '~>1.6')
  s.add_dependency('json', '~>1.6')

  s.add_development_dependency('test-unit')

  s.files       = ["lib/mijireh.rb"]
end
