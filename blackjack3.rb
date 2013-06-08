def total(cards)
arr = cards.map{|e| e[0]}

total = 0
arr.each do |value|
if value == "A"
total += 11	
elsif value.to_i == 0 # J, Q, K
total += 10
else total += value.to_i
end
end

#correct for Aces
arr.select{|e| e =="A"}.count.times do
if total > 21
total -=10
end
end

total

end



#Opening
puts "Hello. Welcome to BlackJack!"
puts "What is your name?"
player_name = gets.chomp

player = []
dealer = []


suit = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
card = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

#deck = []
#suit.each do |suits|
# card.each do |cards|
# deck << [suits, cards]

deck = card.product(suit)

deck.shuffle!
deck.shuffle!

#Deal Hands

player << deck.pop
dealer << deck.pop
player << deck.pop
dealer << deck.pop

dealer_total = total(dealer)
player_total = total(player)
 
player_result = "#{player_name} your cards are #{player.to_s} for a total of #{player_total}"
puts player_result
puts
dealer_result = "The dealer is showing #{dealer[1].to_s}"
puts dealer_result
question = "Would you like to 'Hit' or 'Stay', " + player_name + "?"
puts
puts question
answer = gets.chomp

stay = false
again = puts "Would you like to play again, #{player_name}?"
play_again = true

while play_again == true

if player_total > 21
puts "Sorry #{player_name}, you lose :("
end

if dealer_total > 21
puts "The dealer busts! You Win!"
end

#Player
while player_total < 22
if player_total == 21
puts "Black Jack! You Win!"
again
play_again = gets.chomp
elsif answer.downcase == "stay"
puts "You have decided to stay on #{player_total}."
stay = true
break
else answer.downcase == 'hit'
player << deck.pop
player_total = total(player)
puts "Now you have #{player.to_s} for a total of #{player_total}."
if player_total > 21
puts "Sorry #{player_name}, you lose :("
again
play_again = gets.chomp
elsif player_total == 21
puts "Black Jack! You Win!"
again
play_again = gets.chomp
else puts question
answer = gets.chomp

end
end
end



puts

# Dealer


if stay == true
puts
puts "The dealer has #{dealer.to_s} for a total of #{dealer_total}."
while dealer_total < player_total && dealer_total < 22
dealer << deck.pop
dealer_total = total(dealer)
puts "The dealer now has #{dealer.to_s} for a total of #{dealer_total}."
if dealer_total > player_total && dealer_total < 22
puts "You lose. The dealer has #{dealer.to_s} for a total of #{dealer_total}."
again
play_again = gets.chomp
elsif dealer_total <= player_total
dealer << deck.pop
dealer_total = total(dealer)
if dealer_total > 21
puts "The dealer busts with #{dealer.to_s}, you win!"
again
play_again = gets.chomp
end
end	
end
end
end