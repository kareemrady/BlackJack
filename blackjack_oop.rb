class Cards
	attr_accessor :suit, :arr, :deck
	@@suit = ["S", "H", "C", "M"]
	
	@@arr = ["A", "2", "3", "4", "5", "6", "7", "8", "9"]
	def create_deck
		@deck = @@suit.product(@@arr).shuffle!
	end
	end
	


class BlackJack < Cards
	attr_accessor :player_name, :hit_player, :stay_player, :player_cards, :player_score, :dealer_cards, :dealer_score, :deck
		@@deck = Cards.new.create_deck
	
	@@player_cards = []
	@@dealer_cards = []
	def hit_player
		@@player_cards<<@@deck.pop
		
		@player = @@player_cards.map {|card| card[1]}
		@@player_score = 0
		@player.each do |value|
		if value.to_i == 0
			@@player_score += 11
		else
			@@player_score += value.to_i
		end
		end
	end

	def hit_dealer
		@@dealer_cards<<@@deck.pop
		@dealer = @@dealer_cards.map {|card| card[1]}
		@@dealer_score = 0
		@dealer.each do |value|
		if value.to_i == 0
			@@dealer_score += 11
		else
			@@dealer_score += value.to_i
		end
		
	end
	end
	
		def start
	puts "Welcome to BlackJack. What's Your name ?"
	@player_name = gets.chomp.capitalize
	puts "Hi #{@player_name} lets get started"
	hit_player
	hit_dealer
	hit_player
	hit_dealer
	puts "#{@player_name} has #{@@player_cards} & a score of #{@@player_score}"
	puts "Dealer has #{@@dealer_cards} & a score of #{@@dealer_score}"
end
	end
	
	
	game = BlackJack.new
	game.start
