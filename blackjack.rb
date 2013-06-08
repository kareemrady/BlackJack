puts "Welcome to BlackJack"
puts "whats your name?"
@player_name = gets.chomp
puts" Hi #{@player_name}, let's get started !"
@deck_d = []
@deck_s = []
@deck_c = []
@deck_h = []

# a function to help generate the face cards into the deck (100% sure it could be done better)
# basically it adds a red and black face card ( queen, jack, king ) to each type of cards (diamonds / clubs / hearts / spades )
# J for Jack, Q for Queen, K for King, S for Spades, C for Clubs, H for Hearts, D for Diamonds , B for black, R for Red
def suit
	suit_d = []
	suit_s = []
	suit_c = []
	suit_h = []
	suit_d<<"JDB"
	suit_d<<"JDR"
	suit_d<<"QDB"
	suit_d<<"QDR"
	suit_d<<"KDB"
	suit_d<<"KDR"
@deck_d += suit_d
	suit_s<<"JSB"
	suit_s<<"JSR"
	suit_s<<"QSB"
	suit_s<<"QSR"
	suit_s<<"KSB"
	suit_s<<"KSR"
@deck_s += suit_s
	suit_c<<"JCR"
	suit_c<<"JCB"
	suit_c<<"QCB"
	suit_c<<"QCR"
	suit_c<<"KCS"
	suit_c<<"KCR"
@deck_c += suit_c
    suit_h<<"JHR"
	suit_h<<"JHB"
	suit_h<<"QHB"
	suit_h<<"QHR"
	suit_h<<"KHS"
	suit_h<<"KHR"
@deck_h += suit_h

    
end

#  functions used to generate 1 to 10 cards for each type of cards with black or red colors
# again pretty sure could be optimized some how 
def deck_diamonds
	x = (1..10)
	x.each {|num| @deck_d<<num.to_s + "DB"}
	x.each {|num| @deck_d<<num.to_s + "DR"}
@deck_d
end

def deck_spades
	x = (1..10)
	x.each {|num| @deck_s<<num.to_s + "SB"}
	x.each {|num| @deck_s<<num.to_s + "SR"}
@deck_s
end

def deck_clubs
	x = (1..10)
	x.each {|num| @deck_c<<num.to_s + "CB"}
	x.each {|num| @deck_c<<num.to_s + "CR"}
@deck_c
end

def deck_hearts
	x = (1..10)
	x.each {|num| @deck_c<<num.to_s + "HB"}
	x.each {|num| @deck_c<<num.to_s + "HR"}
@deck_h
end



def game
# using all the above functions to generate the full deck
# initialize all variables and accumulators
suit
deck = deck_hearts + deck_spades + deck_diamonds + deck_clubs
user_input = nil
hit = rand(deck.length) + 1
player_cards =[]
player_result = 0
dealer_result = 0
dealer_cards = []
hand = 0
while hand < 2

if player_result < 21
puts "Select one of the following options : 1) Hit 2) Stay "
user_input = gets.chomp
if user_input == "1"
	# randomly a number is selected which represents an index of the array representing the deck
	player_selection = deck[hit]
	# the card corresponding to the random index selected is pushed in the player_cards array 
	player_cards<<player_selection
	# the random card selected is deleted from the deck so that the dealer or the player cannot select the same card again
	deck.delete(player_selection)
	# the value of the card is computed "10SR".to_i will correspond to 10, "JSR".to_i will return 0 
	value_of_card_player = player_selection.to_i
	# if the retuned value is 0 that means it is a face card which means adds 10 to the player_result
	if value_of_card_player == 0 
		player_result += 10
		
	else
		player_result += value_of_card_player
		
	end
	if dealer_result <= 17
	dealer_selection = deck[hit]
	dealer_cards<<dealer_selection
	deck.delete(dealer_selection)
	value_of_card_dealer = dealer_selection.to_i
	if value_of_card_dealer == 0
		dealer_result += 10
		
	else
		dealer_result += value_of_card_dealer
	end
			# if the dealer has a result of 17 or more the computer will randomly select one of the two options either "hit" or "stay"
	
	else
		dealer_select = rand(2) + 1
		if dealer_select == 1
		dealer_selection = deck[hit]
		dealer_cards<<dealer_selection
		deck.delete(dealer_selection)
		value_of_card_dealer = dealer_selection.to_i
		if value_of_card_dealer == 0
			dealer_result += 10
		else
			dealer_result += value_of_card_dealer
		end
		
	    dealer_result
	end
		
	dealer_result
	
end
	
		

else 
	player_result
	if dealer_result <= 17
	dealer_selection = deck[hit]
	dealer_cards<<dealer_selection
	deck.delete(dealer_selection)
	value_of_card_dealer = dealer_selection.to_i
		if value_of_card_dealer == 0
			dealer_result += 10
		
		else
			dealer_result += value_of_card_dealer
		end
			# if the dealer has a result of 17 or more the computer will randomly select one of the two options either "hit" or "stay"
	else
	dealer_select = rand(2) + 1
		if dealer_select == 1
			dealer_selection = deck[hit]
			dealer_cards<<dealer_selection
			deck.delete(dealer_selection)
			value_of_card_dealer = dealer_selection.to_i
				if value_of_card_dealer == 0
					dealer_result += 10
				else
					dealer_result += value_of_card_dealer
				end
		
			dealer_result
		end
	end
end
puts "dealer score is #{dealer_result}"
puts "player score is #{player_result}"



 

end
hand +=1
end
puts "#{@player_name} ,your score is #{player_result}"

if player_result == dealer_result
		puts "#{@player_name} You scored #{player_result} & the dealer scored #{dealer_result}" 
	puts "Draw"
elsif dealer_result == 21
		
		puts "Busted !!, You scored #{player_result} & the dealer scored #{dealer_result}.Better luck next time #{@player_name}"
elsif player_result == 21 or ((21 - player_result) < (21-dealer_result))
	
		puts "You WON !!! , You scored #{player_result} & the dealer scored #{dealer_result}"

	else
				
		puts "Busted !!, You scored #{player_result} & the dealer scored #{dealer_result}.Better luck next time #{@player_name}"
		
	
end


	
puts "Would you like to play again ? 1)play again 2)exit"
play_again = gets.chomp
unless play_again == "2"
	game
end
end



game

puts "have a good day!"

	 	 







	 	 







