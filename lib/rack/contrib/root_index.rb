module Rack
  
  # Rack::RootIndex returns the contents of a specified file when a client
  # requests the root directory.
  #
  #   use Rack::RootIndex, 'path/to/index.html'
  #
  class RootIndex
  
    def initialize(app, index_file)
      @app = app
      @index_file = index_file
    end
    
    def call(env)
      req = Rack::Request.new(env)
      res = Rack::Response.new

      if req.path_info == '/'
        res.write ::File.read(@index_file)
        res.finish
      else
        @app.call(env)
      end
    end

  end
end
