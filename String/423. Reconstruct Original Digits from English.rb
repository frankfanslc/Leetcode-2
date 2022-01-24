require 'pry'

def original_digits(s)
  return "" if s.nil? || s.empty?

  chars = s.chars
  result = ""

  while chars.any?
    chars.each do |char|
      if char == "w"
        chars.delete_at(chars.index("t"))
        chars.delete_at(chars.index("w"))
        chars.delete_at(chars.index("o"))
        result << "2"
      end

      if char == "z"
        chars.delete_at(chars.index("z"))
        chars.delete_at(chars.index("e"))
        chars.delete_at(chars.index("r"))
        chars.delete_at(chars.index("o"))
        result << "0"
      end

      if char == "g"
        chars.delete_at(chars.index("e"))
        chars.delete_at(chars.index("i"))
        chars.delete_at(chars.index("g"))
        chars.delete_at(chars.index("h"))
        chars.delete_at(chars.index("t"))
        result << "8"
      end

      if char == "x"
        chars.delete_at(chars.index("s"))
        chars.delete_at(chars.index("i"))
        chars.delete_at(chars.index("x"))
        result << "6"
      end

      if char == "u"
        chars.delete_at(chars.index("f"))
        chars.delete_at(chars.index("o"))
        chars.delete_at(chars.index("u"))
        chars.delete_at(chars.index("r"))
        result << "4"
      end

      if (char == "f") && (!chars.include? "u")
        chars.delete_at(chars.index("f"))
        chars.delete_at(chars.index("i"))
        chars.delete_at(chars.index("v"))
        chars.delete_at(chars.index("e"))
        result << "5"
      end

      if (char == "h") && (!chars.include? "g")
        chars.delete_at(chars.index("t"))
        chars.delete_at(chars.index("h"))
        chars.delete_at(chars.index("r"))
        chars.delete_at(chars.index("e"))
        chars.delete_at(chars.index("e"))
        result << "3"
      end

      if (char == "v") && (!chars.include? "f")
        chars.delete_at(chars.index("s"))
        chars.delete_at(chars.index("e"))
        chars.delete_at(chars.index("v"))
        chars.delete_at(chars.index("e"))
        chars.delete_at(chars.index("n"))
        result << "7"
      end

      if (char == "n") && (chars.include? "o") && (!chars.include? "v")
        chars.delete_at(chars.index("o"))
        chars.delete_at(chars.index("n"))
        chars.delete_at(chars.index("e"))
        result << "1"
        break
      end

      if (char == "n") && (!chars.include? "o") && (!chars.include? "v")
        chars.delete_at(chars.index("n"))
        chars.delete_at(chars.index("i"))
        chars.delete_at(chars.index("n"))
        chars.delete_at(chars.index("e"))
        result << "9"
      end
    end
  end

  result.split("").sort.join
end

s = "owoztneoer"
# p original_digits(s) == "012"

# s = "zeroonetwothreefourfivesixseveneightnine"
# p original_digits(s)

s = "neo"
p original_digits(s)
