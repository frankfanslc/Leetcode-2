# The Problem

# Imagine you work at a company that integrates with various SaaS providers to ingest and normalize employee data.
# We have many different types of integrations, including HR Providers (e.g. Gusto), Office Suites (e.g. GSuite),
# Version Control Systems (e.g. Github), and Ticket Management Systems (e.g. Trello). Every night, we run a sync
# job that fetches and standardizes user information from these four providers. However, we may get back conflicting
# data from these services and we want to prioritize different fields from different services. For example,
# we want to prioritize titles from Gsuite over Gusto.

# There are a few things that will always remain true due to how we are standardizing data.
# The data will be a list of objects with keys:
#   * `vendor` (string, name of integration)
#   * `company_name` (string, name of company)
#   * `name` (string, name of user)
#   * `active` (boolean, whether the user is currently employed)
#   * `title` (string, job title)
#   * `employee_type` (string, employee or contractor)
#   * `date_of_birth` (ISO8601 timestamp)

# `company_name` will always be unique for a given company
# `name` will always be unique for a given employee

# We want to merge data according to the following rules:
# * Only pull `date_of_birth` from Gusto
# * Prioritize pulling `title` from GSuite > Gusto > Any other integration
# * Only pull `employee_type` from GSuite and Gusto, and prioritize Gusto > GSuite
# * If `active` is true in any vendor, it should be true
# * The attribute `vendor` should be a list of all vendors we find this user in

# Over time, we will add more attributes, integrations, and rules.

# Write a function that takes as input a list of data pulled from integrations, and returns the merged employee data.

# For example, with the following input:
# ```
# [
#    {
#       "vendor":"gusto",
#       "company_name":"Company",
#       "name":"John Doe",
#       "active":true,
#       "title":"Admin",
#       "employee_type":"employee"
#    },
#    {
#       "vendor":"gsuite",
#       "company_name":"Company",
#       "name":"John Doe",
#       "active":false,
#       "title":"CEO",
#       "employee_type":"employee",
#       "date_of_birth":"2021-01-25T15:14:53+0000"
#    },
#    {
#      "vendor":"trello",
#       "company_name":"Company",
#       "name":"John Doe",
#       "employee_type":"employee"
#    },
#    {
#       "vendor":"gusto",
#       "company_name":"Company",
#       "name":"Adam Doe",
#       "active":true,
#       "title":"CTO",
#       "employee_type":"employee"
#    }
# ]
# ```
# We would get the following output:

# ```
# [
#    {
#       "vendor":[
#          "gusto",
#          "gsuite",
#          "trello"
#       ],
#       "company_name":"Company",
#       "name":"John Doe",
#       "active":true,
#       "title":"CEO",
#       "employee_type":"employee",
#       "date_of_birth":null
#    },
#    {
#       "vendor":[
#          "gusto"
#       ],
#       "company_name":"Company",
#       "name":"Adam Doe",
#       "active":true,
#       "title":"CTO",
#       "employee_type":"employee"
#    }
# ]
# ```


# # https://gist.github.com/chintanparikh/0aa117ada4a185ed384f6e2b0761255e

require 'pry'

def normalize_employee_data(data)
  raise "Input invalid" if data.empty? || data.nil?

  employees = employees(data).uniq # list of names

  employees.map do |employee_name|
    user_data = data.select do |integration|
      integration["name"] == employee_name
    end

    pre_processed = user_data.inject({}) do |memo, integration|
      # Set defaults
      memo["vendor"]       ||= []
      memo["company_name"] ||= ""
      memo["name"]         ||= ""
      memo["date_of_birth"]   = nil

      # Will require postprocessing
      memo["title"]         ||= {}
      memo["employee_type"] ||= {}
      memo["active"]        ||= []

      # No postprocessing necessary
      memo["vendor"] << integration["vendor"]
      memo["company_name"] = integration["company_name"]
      memo["name"] = integration["name"]
      memo["date_of_birth"] = integration["date_of_birth"] if integration["vendor"] == "gusto" # constants

      memo["title"][integration["vendor"]] = integration["title"] # will post process
      memo["employee_type"][integration["vendor"]] = integration["employee_type"]
      memo["active"] << integration["active"] # true for any
      memo
    end

    post_process(pre_processed)
  end
end

def employees(data)
  data.map do |integration|
    integration["name"]
  end
end


# * Only pull `date_of_birth` from Gusto
# * Prioritize pulling `title` from GSuite > Gusto > Any other integration
# * Only pull `employee_type` from GSuite and Gusto, and prioritize Gusto > GSuite
# * If `active` is true in any vendor, it should be true
# * The attribute `vendor` should be a list of all vendors we find this user in
def post_process(employee_data)
  if employee_data["title"]["gsuite"]
    employee_data["title"] = employee_data["title"]["gsuite"]
  elsif employee_data["title"]["gusto"]
    employee_data["title"] = employee_data["title"]["gusto"]
  else
    employee_data["title"].values.compact.sample # random selection from non gusto/gsuite integrations
  end

  if employee_data["employee_type"]["gusto"]
    employee_data["employee_type"] = employee_data["employee_type"]["gusto"]
  elsif employee_data["employee_type"]["gsuite"]
    employee_data["employee_type"] = employee_data["employee_type"]["gsuite"]
  else
    employee_data["employee_type"] = nil
  end

  employee_data["active"] = employee_data["active"].any?
  employee_data
end

data = [
  {
    "vendor" => "gusto",
    "company_name" => "Company",
    "name" => "John Doe",
    "active" => true,
    "title" => "Admin",
    "employee_type" => "employee"
  },
  {
    "vendor" => "gsuite",
    "company_name" => "Company",
    "name" => "John Doe",
    "active" => false,
    "title" => "CEO",
    "employee_type" => "employee",
    "date_of_birth" => "2021-01-25T15:14:53+0000"
   },
   {
    "vendor" => "trello",
    "company_name" => "Company",
    "name" => "John Doe",
    "employee_type" => "employee"
   },
   {
    "vendor" => "gusto",
    "company_name" => "Company",
    "name" => "Adam Doe",
    "active" => true,
    "title" => "CTO",
    "employee_type" => "employee"
   }
]

result = [
  {
    "vendor" => [
      "gusto",
      "gsuite",
      "trello"
    ],
    "company_name" => "Company",
    "name" => "John Doe",
    "active" => true,
    "title" => "CEO",
    "employee_type" => "employee",
    "date_of_birth" => nil
  },
  {
    "vendor" => [
      "gusto"
    ],
    "company_name" => "Company",
    "name" => "Adam Doe",
    "active" => true,
    "title" => "CTO",
    "employee_type" => "employee"
  }
]

p normalize_employee_data(data) == result
p normalize_employee_data(data)

[
  {"vendor"=>[
    "gusto",
    "gsuite",
    "trello"
  ],
   "company_name"=>"Company",
   "name"=>"John Doe",
   "date_of_birth"=>nil,
   "title"=>"CEO",
   "employee_type"=>"employee",
   "active"=>true
  },
  {"vendor"=>[
    "gusto"
  ],
   "company_name"=>"Company",
   "name"=>"Adam Doe",
   "date_of_birth"=>nil,
   "title"=>"CTO",
   "employee_type"=>"employee",
   "active"=>true}
]
