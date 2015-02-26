require 'yaml'

module Git
  class Client
    attr_accessor :client

    def initialize(login, pass)
      @client = Octokit::Client.new(login: login, password: pass)
    end

    def get_pulls
      get_repos.map { |r| client.pull_requests(r, :state => 'open') }
    end

    def get_repos
      YAML.load_file("#{Dir.pwd}/src/repos.yml")
    end

    def get_html_urls
      urls = []
      get_pulls.each do |pull|
        pull.each do |p|
          urls << p[:html_url]
        end
      end
      urls
    end
  end
end
