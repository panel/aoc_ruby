data = File.open('03.txt').read.split("\n")
strategies = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]

class Toboggan 
    def initialize(dx, dy, path)
        @xMax = path[0].length
        @yMax = path.length
        @path = path
        @dx = dx
        @dy = dy
        @hits = 0
        @x = 0
        @y = 0
    end

    def next()
        @y += @dy
        @x = (@x + @dx) % @xMax
        @hits += 1 if !self.done? && @path[@y][@x] == '#'
    end

    def done?()
        @y >= @yMax
    end

    def run()
        while !self.done?
            self.next()
        end

        @hits
    end
end

pt1 = Toboggan.new(3, 1, data)
pt2 = strategies.map { |s| Toboggan.new(s[0], s[1], data).run }
puts "Part 1: #{pt1.run}"
puts "Part 2: #{pt2.reduce(:*)}"