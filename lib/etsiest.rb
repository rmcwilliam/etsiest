require "etsiest/version"
require "etsy"
require "pry"
require "sinatra/base"
Etsy.api_key = ENV['ETSY_KEY'] 

module Etsiest
  class App < Sinatra::Base
    set :logging, true


  get "/search" do    # generates data used to duplicate page; drill down and store it! Send data to erb and then drill down? 
  response = Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'], :keywords => 'whiskey')
  response = response.result
  erb :index, locals: {results: response}
  end

#binding.pry

    run! if app_file == $0
  end
end

#
# ETSY_KEY=foobarbaz bundle exec ruby lib/etsiest.rb
# alias etsy='ETSY_KEY=ENTER KEY HERE bundle exec ruby lib/etsiest.rb'