require 'json'
require_relative 'plan'

data = JSON.parse File.read("#{__dir__}/data.json")

column_map = data["meta"]["view"]["columns"].reject { |c| c["id"] == -1 }
  .map { |c| [c["name"], c["id"].to_s] }.to_h

data["data"].each do |column|
    Plan.create state:         column[column_map["State"]],
                child_premium: column[column_map["Premium Child"]],
                plan_type:     column[column_map["Plan Type"]]
end

Plan.count
Plan.pluck :child_premium
Plan.pluck :plan_type
