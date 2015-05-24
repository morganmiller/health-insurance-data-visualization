require 'sinatra'

# TODO: This reparses/imports every time, would be better to do that only once
require_relative 'import'

class MahApp < Sinatra::Base
  get '/plans' do
    content_type :json
    Plan.all.to_json
  end

  get '/plans/:id' do
    content_type :json
    begin
      Plan.find(params[:id]).to_json
    rescue ActiveRecord::RecordNotFound
      status 404
      {error: "Not a valid id"}.to_json
    end
  end
end
