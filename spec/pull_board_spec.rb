require_relative "spec_helper"
require_relative "../pull_board.rb"

def app
  PullBoard
end

describe PullBoard do
  it "responds with a welcome message" do
    get '/'

    last_response.body.must_include 'Welcome to the Sinatra Template!'
  end
end
