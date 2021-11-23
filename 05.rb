input = ENV['TEST'] ? '05.test.txt' : '05.txt'
data = File.read(input).split("\n")

class Seat
  def initialize(data)
      @row = self.to_bin 'F', data[0..6]
      @column = self.to_bin 'L', data[7..11]
  end

  def seat_id()
    @row * 8 + @column
  end

  def to_bin(zero, str)
    bin = str.split('').map do |x| 
      x == zero ? 0 : 1
    end

    bin.join('').to_i(2)
  end
end

seats = []
max_seat_id = data.reduce(0) do |max_seat_id, boarding_pass|
  seat_id = Seat.new(boarding_pass).seat_id
  seats.push seat_id
  seat_id > max_seat_id ? seat_id : max_seat_id
end

puts "Part 1: #{max_seat_id}"

gap = seats.sort.each_cons(2).select { |a, b| a + 1 != b }.first
puts "Part 2: #{gap[0] + 1}"