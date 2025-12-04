# frozen_string_literal: true

inputs = File.readlines(File.join(__dir__, 'data.txt'), chomp: true)
result = 0
match = '@'
grid = [
  '.' * (inputs.first.length + 2),
  *inputs.map { |line| ".#{line}." },
  '.' * (inputs.first.length + 2)
]

grid.each_with_index do |line, i|
  line.chars.each_with_index do |char, j|
    next unless char == match
    next unless i.positive? && i < grid.length - 1
    next unless j.positive? && j < line.length - 1

    count = 0

    count += 1 if grid[i - 1][j - 1] == match
    count += 1 if grid[i - 1][j] == match
    count += 1 if grid[i - 1][j + 1] == match

    count += 1 if grid[i + 1][j - 1] == match
    count += 1 if grid[i + 1][j] == match
    count += 1 if grid[i + 1][j + 1] == match

    count += 1 if grid[i][j - 1] == match
    count += 1 if grid[i][j + 1] == match

    result += 1 if count < 4
  end
end

puts result
