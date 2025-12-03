# frozen_string_literal: true

inputs = File.readlines(File.join(__dir__, 'data.txt'), chomp: true)

result = []

inputs.each do |input|
  cells = input.chars

  voltages = []

  cells.each_with_index do |cell_one, i|
    cells.each_with_index do |cell_two, j|
      next if i >= j

      voltages << "#{cell_one}#{cell_two}".to_i
    end
  end

  result << voltages.max
end

puts result.sum
