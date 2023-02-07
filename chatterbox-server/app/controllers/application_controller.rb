require "pry"

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/messages' do
    message = Message.created_at
    message.to_json
  end

  post '/messages' do
    message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    message.to_json
  end

  patch '/messages/:id' do
    message = Message.find(params[:id])
    # binding.pry
    message.update(
      body: params[:body]
    )
    message.to_json
  end

  delete '/messages/:id' do
    message = Message.find(params[:id])
    message.destroy
  end

end
