require 'test_helper'

class AppTest < Minitest::Spec
  include Rack::Test::Methods

  def app
    MahApp
  end

  it 'GET to /plans lists health care plan data' do
    plan = Plan.create state: 'AK', child_premium: 123, plan_type: 'PPO'

    response = get '/plans'
    assert_equal 200, response.status
    assert_equal 'application/json', response.content_type

    assert_equal [{id: plan.id, state: 'AK', child_premium: 123, plan_type: 'PPO'}],
                 JSON.parse(response.body, symbolize_names: true)
  end

  it 'GET to /plans/id shows data for the plan with that id' do
    plan = Plan.create state: 'AK', child_premium: 123, plan_type: 'PPO'

    response = get "/plans/#{plan.id}"
    assert_equal 200, response.status
    assert_equal 'application/json', response.content_type

    assert_equal({id: plan.id, state: 'AK', child_premium: 123, plan_type: 'PPO'},
      JSON.parse(response.body, symbolize_names: true))
  end
  
  it 'if the id doesn\'t exist, renders a 404 with a description of the error'
end
