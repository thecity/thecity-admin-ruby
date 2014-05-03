Gem::Specification.new do |s|
  PROJECT_GEM = 'the-city-admin'
  PROJECT_GEM_VERSION = '0.7.1'
  
  s.name = PROJECT_GEM
  s.version = PROJECT_GEM_VERSION
  s.platform = Gem::Platform::RUBY
  #s.date = '2009-01-05'

  s.homepage = 'https://github.com/thecity/thecity-admin-ruby'
  s.rubyforge_project = 'Project on www.github.com'
  s.authors = ['Wes Hays', 'Jason Hagglund']
  s.email = ['wes@onthecity.org', 'jasonh@onthecity.org']

  s.summary = 'Ruby gem/plugin to interact with The City Admin API (https://api.onthecity.org).'
  s.description = 'Ruby gem/plugin to interact with The City Admin API (https://api.onthecity.org). Check out the project on github for more detail.'

  s.add_dependency('typhoeus', '0.6.6')
  s.add_dependency('json')


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
