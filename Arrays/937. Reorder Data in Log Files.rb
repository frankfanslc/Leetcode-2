require 'pry'

def reorder_log_files(logs)
  # Partition logs by letter logs and digit logs
  # ex. [["let1 art", "let2 can"], ["dig1 2 3", "dig2 4 5"]]
  partitions = logs.partition do |log|
    log = log.split(" ")
    !("0".."9").include? log[1][0]
  end

  partitions[0].sort! do |p1, p2|
    p1_split = p1.split(" ")
    p2_split = p2.split(" ")

    # Check to see if letter log contents are equal
    # If they are, sort by identifier
    # Otherwise sort by letter log contents
    if p1_split[1..-1] == p2_split[1..-1]
      p1_split[0] <=> p2_split[0]
    else
      p1_split[1..-1] <=> p2_split[1..-1]
    end
  end

  partitions.flatten
end

output = ["o aay","e yal","w 7 2","l 1 0","6 066"]
p reorder_log_files(["w 7 2", "l 1 0", "6 066", "o aay", "e yal"]) == output

output = ["g1 act car","a8 act zoo","ab1 off key dog","a1 9 2 3 1","zo4 4 7"]
p reorder_log_files(["a1 9 2 3 1","g1 act car","zo4 4 7","ab1 off key dog","a8 act zoo"]) == output

output = ["let1 art can","let3 art zero","let2 own kit dig","dig1 8 1 5 1","dig2 3 6"]
p reorder_log_files(["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"]) == output

