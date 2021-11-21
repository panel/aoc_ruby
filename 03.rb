data = File.open('03.txt').read.split("\n")

class Toboggan 
    def initialize(xMax, yMax, path)
        @xMax = xMax
        @yMax = yMax
        @path = path
        @hits = 0
        @x = 0
        @y = 0
    end

    def next()
        @y += 1
        @x = (@x + 3) % @xMax
        @hits += 1 if !self.done? && @path[@y][@x] == '#'
    end
    
    def hits()
        @hits
    end

    def done?()
        @y >= @yMax
    end
end

toboggan = Toboggan.new(data[0].chars.count, data.count, data)
while !toboggan.done?
    toboggan.next
end

puts "Part 1: #{toboggan.hits}"