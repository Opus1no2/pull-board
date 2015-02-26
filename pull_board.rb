require 'yaml'
require 'src/git_client'

class PullBoard < Sinatra::Base

  set :public_folder => "public", :static => true

  creds = YAML.load_file("#{Dir.pwd}/config/github_auth.yml")

  get "/" do
    @urls = Git::Client.new(creds['usr'], creds['pwd']).get_html_urls
    erb :index
  end
end
