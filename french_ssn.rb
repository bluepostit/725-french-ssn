require 'date'
require 'yaml'

def french_ssn_info(ssn)
  # check if ssn matches regex pattern
  # if it matches,
  # ....
  # else
  #   return error message

  regex = /^(?<gender>[12])\s(?<year>\d{2})\s(?<month>[01]\d)\s(?<department>\d{2})\s\d{3}\s\d{3}\s(?<key>\d{2})/
  return 'The number is invalid' unless ssn.match?(regex)
  match_data = ssn.match(regex)
  gender = match_data[:gender] == '1' ? 'male' : 'female'
  month = Date::MONTHNAMES[match_data[:month].to_i]
  year = match_data[:year]

  departments = YAML.load_file('data/french_departments.yml')
  department = departments[match_data[:department]]

  "a #{gender}, born in #{month}, 19#{year} in #{department}"
end
