# frozen_string_literal: true

inputs = File.readlines(File.join(__dir__, 'data.txt'), chomp: true)

position = 50
count = 0

inputs.each do |input|
  instruction = input[0]
  steps = input[1..].to_i
  index = instruction == 'R' ? 1 : -1

  steps.times do
    position = (position + index) % 100

    count += 1 if position.zero?
  end
end

puts count
