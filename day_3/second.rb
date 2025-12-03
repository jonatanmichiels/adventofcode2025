# frozen_string_literal: true

inputs = File.readlines(File.join(__dir__, 'data.txt'), chomp: true)

result = []

# FIRST ATTEMPT (Brute Force)
# Using combinations to generate all possible batteries of length 12
# inputs.each do |input|
#   cells = input.chars

#   voltages = cells.combination(12).map do |battery_cells|
#     battery_cells.join.to_i
#   end

#   result << voltages.max
# end

# SECOND ATTEMPT (Me being dumb)
# inputs.each do |input|
#   voltages = []
#   cells = input.chars

#   cells.each_with_index do |cell, current_cell_index|
#     cells.each_index do |cell_index|
#       other_cells = input[cell_index..(cell_index + 10)]

#       next unless other_cells.length == 11

#       index_is_in_range = (cell_index..cell_index + 10).include?(current_cell_index)
#       index_is_before_range = current_cell_index < cell_index
#       index_is_after_range = current_cell_index > (cell_index + 10)

#       if index_is_in_range
#         cells_before = other_cells[0, current_cell_index - cell_index]
#         cells_after = other_cells[(current_cell_index - cell_index)..10]

#         battery = cells_before + cell + cells_after
#       elsif index_is_before_range
#         battery = cell + other_cells
#       elsif index_is_after_range
#         battery = other_cells + cell
#       end

#       puts 'INVALID Battery' if battery.length != 12

#       voltages << battery.to_i
#     end
#   end

#   result << voltages.max
# end

# FINAL SOLUTION (Greedy Algorithm) (Googeled after algorithmes after struggling)
def biggest_output(cells)
  stack = []
  to_remove = cells.length - 12

  cells.each_char do |cell|
    while !stack.empty? && to_remove.positive? && stack.last < cell
      stack.pop
      to_remove -= 1
    end

    stack << cell
  end

  stack[0, 12].join
end

inputs.each do |input|
  result << biggest_output(input).to_i
end

puts result.sum
