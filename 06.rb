require 'set'
input = ENV['TEST'] ? '06.test.txt' : '06.txt'
data = File.read(input).split("\n\n").map { |row| row.split("\n") }

pt1 = data.reduce(0) do |sum, group| 
    answers = Set.new
    group.each do |row|
        answers.merge(row.chars)
    end
    sum += answers.size
end

puts "Part 1: #{pt1}"