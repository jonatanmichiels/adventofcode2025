# frozen_string_literal: true

inputs = File.readlines(File.join(__dir__, 'data.txt'), chomp: true)

result = []
fresh_ids = []
available_ids = []

inputs.each do |input|
  next if input.empty?

  if input.include?('-')
    first, last = input.split('-').map(&:to_i)

    fresh_ids << [first.to_i, last.to_i]
  else
    available_ids << input.to_i
  end
end

available_ids.each do |available_id|
  fresh_ids.each do |range|
    first = range[0]
    last = range[1]

    result << available_id if available_id >= first && available_id <= last
  end
end

puts result.uniq.size
