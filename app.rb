require_relative 'lib/game'

game = Game.new

puts "Do you want to play as a code breaker? (Y/N)"
input = gets.chomp!
if input.upcase == "Y"
  game.new_codebreaker_game
elsif input.upcase == "N"
  game.new_codemaker_game
else
  puts "Faulty input"
end

