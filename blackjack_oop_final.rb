class Card
	attr_accessor :suit, :value
	def initialize(suit, value)
		@suit = suit
		@value = value
	end
	def output
		"#{value_name} of #{suit_name}"
	end
	def to_s
		output
	end
	def suit_name
		case suit
		when "D" then "Diamonds"
		when "S" then "Spades"
		when "H" then "Hearts"
		when "C" then "Clubs"
		end
	end
	def value_name
		if value == "A" || value == "K" || value == "Q" || value == "J"
		case value
		when "A" then "Ace"
		when "K" then "King"
		when "J" then "Jack"
		when "Q" then "Queen"
		end
	else
		value
	end

end

 
end

class Deck
	attr_accessor :deck, :cards
	def initialize
		@deck = []
		@cards = []
		["H", "S", "C", "D"].each do |x|
			["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Q", "K", "J"].each do |y|
				@cards << Card.new(x,y)
			end
		end
	end
	def shuffle!
		cards.shuffle!
	end
	def deal_card
		cards.pop
	end



	end




module Hand

	def add_card(new_card)
		cards << new_card
	end

	def total
		total = 0
		values = cards.map {|card| card.value}
		values.each do |v| 
		if v == "A"
			total += 11
		elsif v.to_i == 0
			total += 10
		else
			total += v.to_i
		end
	end
	total
end


	def show_hand
		if name == "Dealer"
			puts "----------------Dealer's Hand------------------"
			puts "#{cards.last}"
			else
				puts "---------------#{name}'s Hand-----------------"
				cards.each {|card| puts card.output}
				
				puts "Total Score : #{total}"
			end
		end
	

	def is_busted?
		total > 21
	end
end



class Player
	include Hand
	attr_accessor :name, :cards
	def initialize(name)
		@name = name
		@cards = []
	end



end

class Dealer
	include Hand
	attr_accessor :name, :cards
	def initialize
		@name = "Dealer"
		@cards = []
	end


end


class BlackJack
	attr_accessor :deck, :player, :dealer
	def initialize
		@deck = Deck.new
		@player = Player.new("player_name")
		@dealer = Dealer.new
	end

def set_name
		puts "What's your name?"
		player.name = gets.chomp.capitalize
	end

	def deal_cards
		player.add_card(deck.deal_card)
		dealer.add_card(deck.deal_card)
		player.add_card(deck.deal_card)
		dealer.add_card(deck.deal_card)
	end

	def show_hands
		player.show_hand
		dealer.show_hand
	end

	def player_turn
		player.add_card(deck.deal_card)
	end

	def blackjack_or_busted?(player_or_dealer)
		if player_or_dealer.total == 21
			if player_or_dealer.is_a?(Dealer)
			 	puts "Dealer hits Blackjack !! #{player.name} Loses"
				
			else 
				puts "Congratulations !!, #{player.name} hits BlackJack!!"
				play_again?
			end
		elsif  player_or_dealer.is_busted?
			if player_or_dealer.is_a?(Dealer)
				puts "Congratulations #{player.name}!!, Dealer Busted !!"
			else
				puts "Dealer score #{dealer.total} ,Dealer Wins!!, #{player.name} Busted!!"
			end

			play_again?
	end
end

def player_turn
	blackjack_or_busted?(player)
	while !player.is_busted?
		puts "What would you like to do? 1)Hit 2)Stay"
		user_input = gets.chomp
		if user_input == "1"
			player.add_card(deck.deal_card)
			puts "#{player.name}'s total is #{player.total}"
			blackjack_or_busted?(player)
		else
			puts "#{player.name} stays"
			puts "#{player.name}'s total is #{player.total}"
			break
			
		end


	end

	def dealer_turn
		blackjack_or_busted?(dealer)
		while dealer.total < 17
			dealer.add_card(deck.deal_card)
			puts "Dealer's total is #{dealer.total}"
			blackjack_or_busted?(dealer)
			
		end
			puts "Dealer stays"
			puts "Dealer's total is #{dealer.total}"
			
			
		end


		end

		def winner?
			if player.total > dealer.total
				"Congratulations #{player.name} Wins!!"
			elsif player.total < dealer.total
				"Dealer scores #{dealer.total} wins !! #{player.name} loses"
			else
				"DRAW"
			end
			play_again?
		end

		def play_again?
			puts "Would you like to play another game? 1)Yes 2)No"
			choice = gets.chomp
		if choice == "1"
			puts "------------------starting a new game-------------------------"
			deck = Deck.new
			player.cards = []
			dealer.cards = []
			start
		else
			puts "Goodbye "
			exit
		end
	end
				

	def start
		deck.shuffle!
		set_name
		deal_cards
		show_hands
		player_turn
		dealer_turn
		winner?
		
		



	end
	
	
end

game = BlackJack.new
game.start