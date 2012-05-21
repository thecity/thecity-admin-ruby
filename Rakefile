namespace :docs do

  desc 'Build the docs for The City Admin API.'
  task :build do
    system('rm -rf doc')
    system('yardoc --no-private --protected lib/**/*.rb')
  end

end