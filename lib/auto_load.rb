module TheCity

  api_path = THECITY_LIB_DIR + '/api/'
  cache_path = THECITY_LIB_DIR + '/cachers/'
  cache_file_path = THECITY_LIB_DIR + '/cachers/file/'
  loaders_path = THECITY_LIB_DIR + '/loaders/'


  require api_path + 'api_object.rb'
  require api_path + 'user.rb'
  require api_path + 'user_list.rb'

  require cache_path + 'cache_adapter.rb'
  require cache_file_path + 'json_cache.rb'

  require loaders_path + 'api_loader.rb'
  require loaders_path + 'user_loader.rb'
  require loaders_path + 'user_list_loader.rb'

end