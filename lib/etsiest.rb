require "etsiest/version"
require "etsy"
require "pry"
require "sinatra/base"
Etsy.api_key = ENV['ETSY_KEY'] 

module Etsiest
  class App < Sinatra::Base
    set :logging, true


  get "/search" do        #search?q=whiskey
  if params["q"]
    response = Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'], :keywords => params["q"])
    response = response.result
    erb :index, locals: {results: response}

  else
    status 204
    {message: "ah ah ah you didn't say the magic word!!!"}
  end

  end


    run! if app_file == $0
  end
end

# ETSY_KEY=foobarbaz bundle exec ruby lib/etsiest.rb
# alias etsy='ETSY_KEY=ENTER KEY HERE bundle exec ruby lib/etsiest.rb'