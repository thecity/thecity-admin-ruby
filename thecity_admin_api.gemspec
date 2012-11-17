Gem::Specification.new do |s|
  PROJECT_GEM = 'the-city-admin'
  PROJECT_GEM_VERSION = '0.4.0'
  
  s.name = PROJECT_GEM
  s.version = PROJECT_GEM_VERSION
  s.platform = Gem::Platform::RUBY
  #s.date = '2009-01-05'

  s.homepage = 'https://github.com/thecity/thecity-admin-ruby'
  s.rubyforge_project = 'Project on www.github.com'
  s.authors = ['Wes Hays']
  s.email = 'wes@onthecity.org'

  s.summary = 'Ruby gem/plugin to interact with The City Admin API (https://api.OnTheCity.org).'
  s.description = 'Ruby gem/plugin to interact with The City Admin API (https://api.OnTheCity.org). Checkout the project on github for more detail.'

  s.add_dependency('typhoeus', '0.5.1')


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
