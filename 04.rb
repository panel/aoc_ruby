passports = File.open("04.txt").read.split("\n\n").map { |x| x.split(/\s/).map { |y| y.split(':') } }
passports.map! { |x| x.to_h }

required_fields = %w(byr iyr eyr hgt hcl ecl pid)
pt1 = passports.select { |x| required_fields.all? { |y| x.has_key?(y) } }
puts "Part 1: #{pt1.length}"

class Height
    def initialize(height)
        m = /(?<height>\d+)(?<unit>(cm|in))/.match(height)
        if m 
            @height = m[:height].to_i
            @unit = m[:unit]
        else
            @unit = nil
            @height = nil
        end
    end

    def valid?
        if @unit == 'cm'
            @height.between?(150, 193)
        elsif @unit == 'in'
            @height.between?(59, 76)
        else
            false
        end
    end
end


validators = [
    lambda { |x| x && x.to_i >= 1920 && x.to_i <= 2002 },
    lambda { |x| x && x.to_i >= 2010 && x.to_i <= 2020 },
    lambda { |x| x && x.to_i >= 2020 && x.to_i <= 2030 },
    lambda { |x|  Height.new(x).valid?  },
    lambda { |hcl| /^#[a-f0-9]{6}$/i.match(hcl) },
    lambda { |ecl| %w(amb blu brn gry grn hzl oth).include?(ecl) },
    lambda { |pid| /^\d{9}$/.match(pid) }
].zip(required_fields)

# what i used to figure out which assertion was failing
# pt2_rejects = pt1.select { |x| !validators.all? { |y| y[0].call(x[y[1]]) } }
# pt2_rejects.each do |x|
#     validators.each do |y|
#         puts "#{y[1]} #{x[y[1]]} #{y[0].call(x[y[1]])}"
#     end
#     puts "----"
# end

pt2 = pt1.select { |x| validators.all? { |y| y[0].call(x[y[1]]) } }
puts "Part 2: #{pt2.length}"