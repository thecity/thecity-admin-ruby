module TheCity

  require THECITY_LIB_DIR + '/exceptions.rb'

  api_path = THECITY_LIB_DIR + '/api/'
  require api_path + 'api_object.rb'
  Dir["#{api_path}/*.rb"].each { |f| require(f) }

  cache_path = THECITY_LIB_DIR + '/cachers/'
  require cache_path + 'cache_adapter.rb'

  cache_file_path = THECITY_LIB_DIR + '/cachers/file/'
  Dir["#{cache_file_path}/*.rb"].each { |f| require(f) }

  loaders_path = THECITY_LIB_DIR + '/loaders/'
  require loaders_path + 'api_loader.rb'
  Dir["#{loaders_path}/*.rb"].each { |f| require(f) }

  savers_path = THECITY_LIB_DIR + '/savers/'
  require savers_path + 'api_saver.rb'
  Dir["#{savers_path}/*.rb"].each { |f| require(f) }

end