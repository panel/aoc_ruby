data = File.open("02.txt").read.split("\n")


d2 = data.map do |line| 
    s = /(?<min>\d+)-(?<max>\d+) (?<test>\w): (?<pw>\w+)/.match(line)
    char = s[:pw].chars.select { |c| c == s[:test] }.count
    char >= s[:min].to_i && char <= s[:max].to_i
end

puts "Part 1: #{d2.select { |x| x == true }.count}"