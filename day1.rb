input = File.readlines('./day1input.txt', chomp: true)
higest = 0
current = 0
input.each do |line|
  if line.strip.empty?
    current = 0
    next
  end

  current += line.to_i
  higest = [higest, current].max
end

# pp higest

elfs = []
current = 0
input.each do |line|
  if line.strip.empty?
    elfs << current
    current = 0
    next
  end

  current += line.to_i
end

pp elfs.sort.last(3).sum
