require 'sinatra'

# TODO: This reparses/imports every time, would be better to do that only once
require_relative 'import'

class MahApp < Sinatra::Base
  get '/plans' do
    content_type :json
    Plan.all.to_json
  end

  # GET /plans/2
  #    {"id": 2, "state": "AL", "child_premium": 456, "plan_type": "HMO"}
end
