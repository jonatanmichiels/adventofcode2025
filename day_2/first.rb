# frozen_string_literal: true

inputs = File.read(File.join(__dir__, 'data.txt'), chomp: true).split(',')

pattern = /^(\d+)\1$/
matches = []

inputs.each do |input|
  start_num, end_num = input.split('-').map(&:to_i)

  (start_num..end_num).each do |num|
    matches << num if num.to_s =~ pattern
  end
end

puts matches.map(&:to_i).sum
