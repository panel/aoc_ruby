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

pt2 = data.reduce(0) do |sum, group| 
    answer_hash = group.reduce({}) do |group_answers, answer|
        answer.chars.each do |char|
            group_answers[char] ||= 0
            group_answers[char] += 1
        end
        group_answers
    end
    sum += answer_hash.values.select { |v| v == group.size }.size
    sum
end

puts "Part 2: #{pt2}"