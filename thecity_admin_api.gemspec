Gem::Specification.new do |s|
  PROJECT_GEM = 'the_city_admin'
  PROJECT_GEM_VERSION = '0.1.0'
  
  s.name = PROJECT_GEM
  s.version = PROJECT_GEM_VERSION
  s.platform = Gem::Platform::RUBY
  #s.date = '2009-01-05'

  s.homepage = 'https://github.com/thecity/thecity-admin-ruby'
  s.rubyforge_project = 'Project on www.github.com'
  s.authors = ['Wes Hays']
  s.email = 'wes@onthecity.org'

  s.summary = 'Ruby gem/plugin to interact with The City Admin API (http://api.OnTheCity.org).'
  s.description = 'Ruby gem/plugin to interact with The City Admin API (http://api.OnTheCity.org).'

  s.add_dependency('rake','>= 0.8.3')


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end


  #s.require_path = 'lib/'
  
  # s.files = ['LICENSE',
  #            'README',
  #            'lib/common_project_tasks.rb',
  #            'lib/common_project_tasks/app.rake',
  #            'examples/app_vars.yml']
             
  # s.has_rdoc = true
  # s.extra_rdoc_files = %w{README LICENSE}
  # s.rdoc_options << '--title' << 'Common Project Tasks Documentation' <<
  #                   '--main' << 'README' << '-q'
