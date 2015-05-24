require 'test_helper'

class AppTest < Minitest::Spec
  attr_reader :plan
  
  include Rack::Test::Methods
  
  def app
    MahApp
  end
  
  def setup
    @plan = Plan.create state: 'AK', child_premium: 123, plan_type: 'PPO'
  end
  
  def assert_gets(path, json, status: 200)
    response = get path
    assert_equal status, response.status
    assert_equal 'application/json', response.content_type

    assert_equal json, JSON.parse(response.body, symbolize_names: true)
  end

  it 'GET to /plans lists health care plan data' do
    assert_gets '/plans', [{id: plan.id, state: 'AK', child_premium: 123, plan_type: 'PPO'}]
  end

  it 'GET to /plans/id shows data for the plan with that id' do
    assert_gets "/plans/#{plan.id}", {id: plan.id, state: 'AK', child_premium: 123, plan_type: 'PPO'}
  end
  
  it 'if the id doesn\'t exist, renders a 404 with a description of the error' do
    assert_gets "/plans/0", {error: "Not a valid id"}, status: 404
  end
end
