# frozen_string_literal: true

inputs = File.readlines(File.join(__dir__, 'data.txt'), chomp: true)

fresh_ids = []

inputs.each do |input|
  next if input.empty?
  next unless input.include?('-')

  first, last = input.split('-').map(&:to_i)

  fresh_ids << [first.to_i, last.to_i]
end

new_ranges = []

while fresh_ids.size.positive?
  first, last = fresh_ids.pop

  if new_ranges.empty?
    new_ranges << [first, last]
    next
  end

  merged_range = [first, last]
  remaining = []

  new_ranges.each do |range|
    if range[1] < merged_range[0] - 1 || range[0] > merged_range[1] + 1
      remaining << range
    else
      merged_range = [[range[0], merged_range[0]].min, [range[1], merged_range[1]].max]
    end
  end

  new_ranges = remaining + [merged_range]
end

result = 0

new_ranges.each do |range|
  result += (range[1] - range[0] + 1)
end

puts result
