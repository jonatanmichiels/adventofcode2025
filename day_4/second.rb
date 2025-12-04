# frozen_string_literal: true

inputs = File.readlines(File.join(__dir__, 'data.txt'), chomp: true)

def count_matches(grid)
  grid.map.with_index do |line, i|
    line.chars.map.with_index do |char, j|
      if char == '@' && i.positive? && i < grid.length - 1 && j.positive? && j < line.length - 1
        count = 0

        count += 1 if grid[i - 1][j - 1] == '@'
        count += 1 if grid[i - 1][j] == '@'
        count += 1 if grid[i - 1][j + 1] == '@'
        count += 1 if grid[i + 1][j - 1] == '@'
        count += 1 if grid[i + 1][j] == '@'
        count += 1 if grid[i + 1][j + 1] == '@'
        count += 1 if grid[i][j - 1] == '@'
        count += 1 if grid[i][j + 1] == '@'

        count < 4 ? 'X' : char
      else
        char
      end
    end.join
  end
end

current_grid = count_matches(
  [
    '.' * (inputs.first.length + 2),
    *inputs.map { |line| ".#{line}." },
    '.' * (inputs.first.length + 2)
  ]
)

current_found_x = current_grid.sum { |line| line.count('X') }

while count_matches(current_grid) != current_grid
  current_grid = count_matches(current_grid)
  current_found_x = current_grid.sum { |line| line.count('X') }
end

puts current_found_x
