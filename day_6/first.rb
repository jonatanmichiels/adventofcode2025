# frozen_string_literal: true

inputs = File.readlines(File.join(__dir__, 'data.txt'), chomp: true)

matrix = inputs.map { |line| line.split(' ') }.transpose

result = 0

matrix.each do |calculation|
  operator = calculation.pop
  value = nil

  calculation.each do |number|
    number = number.to_i

    if value.nil?
      value = number
    elsif operator == '+'
      value += number
    elsif operator == '*'
      value *= number
    end
  end

  result += value
end

puts result
