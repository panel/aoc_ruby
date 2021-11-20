file = File.open("01.txt")
numbers = file.readlines.map(&:to_i)
part1 = false
part2 = false

numbers.each_with_index do |number, index|
    numbers.slice(index, numbers.length).each do |number2|
        numbers.slice(index + 1, numbers.length).each do |number3|
            if number + number2 == 2020
                part1 = number * number2
                puts "Part 1: #{part1}"
                if part1 && part2
                    exit
                end
            end

            if number + number2 + number3 == 2020
                part2 = number * number2 * number3
                puts "Part 2: #{part2}"
                if part1 && part2
                    exit
                end
            end
        end
    end
end

