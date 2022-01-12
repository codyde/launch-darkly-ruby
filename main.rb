require 'sinatra'
require 'ldclient-rb'

user = {firstName: "Cody", lastName: "De", key: "prod1234", email: "cd@launchdarkly.com"}

get '/' do
  client = LaunchDarkly::LDClient.new(ENV['LD_SDK_KEY'])
  pageTheme = client.variation("pageTheme", user, false)
  @cards = client.variation("cards", user, false)
  @imageConfig = client.variation("imageConfig", user, 'toggleUp.png')
  if pageTheme
    erb :index
  else
    '<h1>Welcome to a sad and unformatted Ruby and LaunchDarkly page</h1>'
  end
end
