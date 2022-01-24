require 'pry'

def subdomain_visits(cpdomains)
  return [] if cpdomains.empty? || cpdomains.nil?

  result = {}

  cpdomains.each do |cpdomain|
    count, subs = cpdomain.split(" ")
    subs = subs.split(".")

    while subs.any?
      sub = subs.join(".")
      result[sub] ||= 0
      result[sub] += count.to_i
      subs.shift
    end
  end

  result.map do |k,v|
    "#{v} #{k}"
  end
end

cpdomains = ["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]
p subdomain_visits(cpdomains) == ["901 mail.com","50 yahoo.com","900 google.mail.com","5 wiki.org","5 org","1 intel.mail.com","951 com"]
