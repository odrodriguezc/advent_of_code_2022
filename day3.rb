input = File.readlines('./day3input.txt', chomp: true)
types_order = ('a'..'z').to_a + ('A'..'Z').to_a
total = input.inject(0) do |acc, rucksack|
  a, b = rucksack.chars.each_slice(rucksack.size / 2).to_a
  types = a & b
  acc += types.sum { |t| types_order.index(t) + 1 }
  acc
end

total2 = 0
input.each_slice(3) do |batch|
  types = batch[1..-1].inject(batch[0].chars) { |acc, rucksack| acc &= rucksack.chars }
  total2 += types.sum { |t| types_order.index(t) + 1 }
end

pp total2
