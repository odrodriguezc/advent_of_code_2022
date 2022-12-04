# Avent of code day 2
# A for Rock, B for Paper, and C for Scissors.
# X for Rock, Y for Paper, and Z for Scissors.

points = { win: 6, lose: 0, draw: 3 }
lettre_vals = { 'A' => 1, 'B' => 2, 'C' => 3, 'X' => 1, 'Y' => 2, 'Z' => 3 }
win_cases = [%w[A Y], %w[B Z], %w[C X]]
lose_cases = [%w[A C], %w[B X], %w[C Y]]

input = File.readlines('./day2input.txt', chomp: true)
total_points = input.each_with_object({ case1: 0, case2: 0 }) do |game, acc|
  opponent, myself = game.split
  acc[:case1] += if lettre_vals[opponent] == lettre_vals[myself]
                   points[:draw] + lettre_vals[myself]
                 elsif win_cases.include?([opponent, myself])
                   points[:win] + lettre_vals[myself]
                 else
                   lettre_vals[myself]
                 end

  acc[:case2] += if myself == 'Y'
                   points[:draw] + lettre_vals[opponent]
                 elsif myself == 'Z'
                   points[:win] + lettre_vals[win_cases.find { |op, _ms| op == opponent }.last]
                 else
                   lettre_vals[lose_cases.find { |op, _ms| op == opponent }.last]
                 end
end

pp total_points
