
# Scoring Rules
def card_value(cards)
	value_array = cards.map {|card| card[1]}
	total = 0
	value_array.each do |value|
	
	if value == "A"
		total += 11
	elsif value.to_i == 0
		total += 10
	else 
		total += value.to_i
	end
end
total
end

# Creating a deck of cards
suit = ["S", "H", "C", "D"]
cards = ["2","3","4","5","6","7","8","9"]

deck = suit.product(cards).shuffle!

# setting the variable
player_cards = []
dealer_cards = []
player_score = 0
dealer_score = 0

# first hand

player_cards<<deck.pop
dealer_cards<<deck.pop
player_cards<<deck.pop
dealer_cards<<deck.pop

player_score = card_value(player_cards)
dealer_score = card_value(dealer_cards)

puts "Your cards are #{player_cards} for a score of #{player_score}"
puts "The dealer cards are #{dealer_cards} for a score of #{dealer_score}"
if player_score == 21
	puts"Black Jack ! , You scored #{player_score} . Player Wins"
exit
end
while player_score < 21
	puts "What would you like to do? press 1) Hit 2) Stay"
player_input = gets.chomp 
if player_input == "1"
	player_cards<<deck.pop
	player_score = card_value(player_cards)
	puts "your total now is #{player_score}"
else
	player_score
	puts "your total is #{player_score}"
	break
end
end

if dealer_score == 21
  puts "Sorry, dealer hit blackjack. You lose."
  exit
end

while dealer_score < 17
  #hit
  dealer_cards << deck.pop
  dealer_score = card_value(dealer_cards)
  puts "Dealer total is now: #{dealer_score}"

  if dealer_score == 21
    puts "Sorry, dealer hit blackjack. You lose."
    exit
  elsif dealer_score > 21
    puts "Congratulations, dealer busted! You win!"
    exit
  end
end


if dealer_score > player_score
  puts "Sorry, dealer wins."
elsif dealer_score < player_score
  puts "Congratulations, you win!"
else
  puts "It's a tie!"
end

exit

