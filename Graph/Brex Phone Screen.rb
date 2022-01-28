require 'pry'

# {
#  "Joe"    => ["Miami", "withdraw", "New York", "updateaddress"],
#  "John"   => ["San Francisco", "deposit"],
#  "Albert" => ["London", "withdraw"],
#  "Diana"  => ["London", "withdraw", "San Francisco"]
# }
def find_suspicious_activities(sus_activities, new_activities, k)
  return StandardError if sus_activities.nil? || new_activities.nil? || k.nil?

  sus_activities = sus_activities.first
  result = []

  stack = new_activities

  while stack.any?
    activity = stack.pop

    sus_counter = 0
    sus_counter += 1 if sus_activities.include? activity[0]
    sus_counter += 1 if sus_activities.include? activity[1]
    sus_counter += 1 if sus_activities.include? activity[2]

    if sus_counter >= k
      result << activity

      sus_activities << activity
      sus_activities.flatten!.uniq!

      stack = new_activities - result
    end
  end

  result
end

sus_activities = [
  ["Brad", "San Francisco", "withdraw"]
]

new_activities = [
  ["Joe", "Miami", "withdraw"],
  ["John", "San Francisco", "deposit"],
  ["Albert", "England", "withdraw"],
  ["Diana", "London", "withdraw"],
  ["Diana", "San Francisco", "withdraw"],
  ["Joe", "New York", "updateaddress"]
]

p find_suspicious_activities(sus_activities, new_activities, 2)
