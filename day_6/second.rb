# frozen_string_literal: true

inputs = File.readlines(File.join(__dir__, 'data.txt'), chomp: true)

matrix = inputs.map(&:chars).transpose

result = 0
operator = nil
calc = nil

matrix.each_with_index do |item, index|
  operator = item.pop if operator.nil?
  value = item.join.to_i

  if matrix.length - 1 == index
    result += calc + value
    next
  end

  if item.join.strip.empty?
    result += calc
    calc = nil
    operator = nil
    next
  end

  if calc.nil?
    calc = value
  elsif operator == '+'
    calc += value
  elsif operator == '*'
    calc *= value
  end
end

puts result
