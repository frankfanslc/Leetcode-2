require 'pry'

def eval_rpn(tokens)
  return 0 if tokens.empty? || tokens.nil?
  return tokens[-1].to_i if tokens.length == 1

  stack = [tokens.pop]
  result = nil
  operators = {
    "+" => :+,
    "-" => :-,
    "/" => :/,
    "*" => :*
  }

  while stack.any?
    if integer?(stack[-1]) && integer?(stack[-2])
      operands1 = stack.pop
      operands2 = stack.pop
      operator  = stack.pop

      result = operands1.to_i.to_f.send(operators[operator], operands2.to_i).to_i

      if stack.empty?
        return result
      else
        stack << result.to_s
      end
    else
      current = tokens.pop

      if current
        stack << current
      end
    end
  end

  result
end

def integer?(num)
  # non integers will evaluate to 0 on
  # .to_i and thus will not return true
  # when compared to it's original string
  num.to_i.to_s == num
end

tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
p eval_rpn(tokens) == 22
