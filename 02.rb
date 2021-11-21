data = File.open("02.txt").read.split("\n")

p1 = []
p2 = []
d2 = data.each do |line| 
    s = /(?<min>\d+)-(?<max>\d+) (?<test>\w): (?<pw>\w+)/.match(line)
    char = s[:pw].chars.select { |c| c == s[:test] }.count
    p1.push char >= s[:min].to_i && char <= s[:max].to_i
    
    t1 = s[:pw][s[:min].to_i - 1] == s[:test] 
    t2 = s[:pw][s[:max].to_i - 1] == s[:test]

    p2.push (!t1 == t2)
end

puts "Part 1: #{p1.select { |x| x == true }.count}"
puts "Part 2: #{p2.select { |x| x == true }.count}"