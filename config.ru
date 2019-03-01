require 'pry'

class Application
  def call(env)
    request(env['REQUEST_METHOD'], env['PATH_INFO'])
  end

  def request(method, path)
    if path == '/signup'
      if method == 'GET'
        get(path, method)
      elsif method == 'POST'
        post(path, method)
      end
    else
      request_path(path)
    end
  end

  def get(path, method)
    [200, { 'Content-Type' => 'text/html' }, ["You have requested the path #{path}, using #{method}"]]
  end

  def post(path, method)
    [201, { 'Content-Type' => 'text/html' }, ["You have requested the path #{path}, using #{method}"]]
  end

  def request_path(path)
    [404, { 'Content-Type' => 'text/html' },["Hey, I dont know what you mean"]]
  end
end

run Application.new
