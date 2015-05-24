require 'json'
require 'plan'

module Import
  def self.call(filename)
    data = JSON.parse File.read(filename)

    column_map = data["meta"]["view"]["columns"]
                   .reject { |c| c["id"] == -1 }
                   .map { |c| [c["name"], c["id"].to_s] }
                   .to_h

    data["data"].each do |column|
        Plan.create! state:         column[column_map["State"]],
                     child_premium: column[column_map["Premium Child"]],
                     plan_type:     column[column_map["Plan Type"]]
    end
  end
end
