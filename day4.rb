require 'ostruct'

input = File.readlines('./day4input.txt', chomp: true)

data = input.map do |pair|
  cleaners = pair.split(',').map do |c|
    start, finish = c.split('-').map(&:to_i)
    OpenStruct.new({ start: start, end: finish })
  end
  OpenStruct.new({ first: cleaners[0], second: cleaners[1] })
end

total = data.count do |pair|
  a = (pair.first.start..pair.first.end).to_a
  b = (pair.second.start..pair.second.end).to_a
  communs = a & b

  communs.count == b.count ||
    communs.count == a.count
end

total = data.count do |pair|
  a = (pair.first.start..pair.first.end).to_a
  b = (pair.second.start..pair.second.end).to_a
  communs = a & b

  !communs.empty?
end

# class Assignment
#   attr_accessor :elves

#   def initialize(line)
#     @elves = line.split(',').map do |e|
#       start, finish = e.split('-').map(&:to_i)
#       Elve.new(start, finish)
#     end
#   end

#   def totally_overlap?
#     sorted_elves = @elves.sort_by do |elve|
#       elve.section.finish - elve.section.start
#     end

#     sorted_elves.any? do |elve|
#       sorted_elves.any? do |e|
#         next if e == elve

#         totally?(elve, e)
#       end
#     end
#   end

#   def partially_overlap?
#     sorted_elves = @elves.sort_by do |elve|
#       elve.section.finish - elve.section.start
#     end

#     sorted_elves.any? do |elve|
#       sorted_elves.any? do |e|
#         next if e == elve

#         partially?(elve, e)
#       end
#     end
#   end

#   def not_overlap?
#     !totally_overlap? && !partially_overlap?
#   end

#   private

#   def totally?(elve_a, elve_b)
#     elve_b.section.start >= elve_a.section.start &&
#       elve_b.section.finish <= elve_a.section.finish
#   end

#   def partially?(elve_a, elve_b)
#     ((elve_b.section.start <= elve_a.section.finish && elve_b.section.start >= elve_a.section.start) ||
#       (elve_b.section.finish >= elve_a.section.start && elve_b.section.finish <= elve_a.section.finish)) &&
#       !totally?(elve_a, elve_b)
#   end
# end

# class Elve
#   attr_accessor :section

#   def initialize(start, finish)
#     @section = Section.new(start, finish)
#   end
# end

# class Section
#   attr_accessor :start, :finish

#   def initialize(start, finish)
#     @start = start
#     @finish = finish
#   end

#   def to_a
#     (@start..@finish).to_a
#   end
# end

# pp ass = Assignment.new(input.first)
# pp ass.totally_overlap?
# pp ass.partially_overlap?
