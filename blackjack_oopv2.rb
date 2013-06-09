class Deck
	attr_accessor :suit, :number
	def initialize
	end
	@@suit = ["S", "H", "C", "D"]
  @@number = ["A", "2", "3", "4", "5", "6", "7", "8", "9" ]
  def shuffle
   @deck =@@suit.product(@@number).shuffle!
 end

end

module Hit_Stay
	@@deck = Deck.new.shuffle
def hit
	@cards<<@@deck.pop
	arr = @cards.map {|card| card[1]}
	@score = 0
	arr.each do |e|
	if e == "A"
		@score += 11
elsif e.to_i ==0
	 @score += 10 
else
	 @score += e.to_i
end
end
end

def stay
	@cards
	@score
end

end


class Player 
	include Hit_Stay

	attr_accessor :name, :score, :cards
	def initialize(name)
		@name = name
		@cards = []
	end
end

class Dealer 
	include Hit_Stay
	attr_accessor :score, :cards
	def initialize
		@cards = []
	end
end

class BlackJack 
	
	puts "Hi, Welcome to BlackJack"
	puts "What is your name?"
	player_name = gets.chomp.capitalize!
	puts "Hi #{player_name} let's get started"
	player = Player.new(player_name)
	dealer = Dealer.new
	player.hit
	dealer.hit
	player.hit
	dealer.hit
	puts "#{player.name}, your cards are #{player.cards} & the dealer has #{dealer.cards}"
	puts "#{player.name}, your score is #{player.score} & the dealer scored #{dealer.score}"
		
	while player.score < 21
		puts "what would you like to do? 1)Hit 2)Stay"
user_input = gets.chomp
if user_input == "1"
	player.hit
	puts "#{player.name}, your cards are #{player.cards} & the dealer has #{dealer.cards}"
	puts "#{player.name}, your score is #{player.score} & the dealer scored #{dealer.score}"
else 
	player.stay
	puts "#{player.name}, your cards are #{player.cards} & the dealer has #{dealer.cards}"
	puts "#{player.name}, your score is #{player.score} & the dealer scored #{dealer.score}"
end
while dealer.score < 17
	choice = rand(2) + 1
	if choice == 1
		dealer.hit
	else
		dealer.stay
	end
end
end
	if player.score == 21 && dealer.score == 21
		puts "Draw , #{player.name}, you & the dealer both scored #{player.score}"
	elsif player.score == 21 || (player.score - 21 < dealer.score - 21)
		puts "#{player.name}, You Win!!!, You scored #{player.score} , BlackJack!!!!"
	elsif dealer.score == 21 || (dealer.score - 21 < player.score - 21)
		puts "Dealer hits BlackJack, You Lose. Better luck next time #{player.name}"
	else
		puts "Draw , You Scored #{player.score} & the dealer scored #{dealer.score}"
end
end
game = BlackJack.new




