require "./human.rb"
require "./simulation.rb"
class MainMenu

  def initialize
    @game_state = 0
    @candidate_counter_demo = 0
    @candidate_counter_repub = 0
	  @first_question_answer= 0
    @human_counter = 0
    @first_question_answer_list = ["create","prepopulate list", 1, "list", "update"]
    #@end_loop_first = true
    @name = ""
    @people_list = []
    @first_question_type_list = ["politician", "person", "democrat", "republican", "liberal",
                                "conservative", "tea party", "socialist", "neutral", "ben" ]
  end

#--------------------------------------------------------------------------------------------------------
#methods for formatting output
#--------------------------------------------------------------------------------------------------------
  def capitalize(text)
	  text.split.map(&:capitalize).join(' ')
  end

  def clear_screen
    puts `clear`
  end

	def put_line
		puts "*" * 150
	end
#--------------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------------
#methods for main menu choices
#--------------------------------------------------------------------------------------------------------

	def showlist
		@people_list.each do |x|
			puts "* #{capitalize(x.type)}, #{capitalize(x.name)}, #{capitalize(x.party)}"
		end
	end
#Method that, when called, pre populates the list variable with a group of people. the people all have random political parties
	def prepopulate_list
		name_list = ['ben', 'bob obobb', 'mary kate', 'kim possible', 'steve-o', 'jill and jack', 'veronica mars', 'danny trejo',
		             'jon snow', 'mario anluigi', 'ed obannon', 'amy winehouse', 'juan jones', 'walter okiefe', 'fred love']
		party_list = ['tea party', 'conservative', 'neutral', 'liberal', 'socialist']
		jimbo = Human.new "politician", 'jimbo jones', 'democrat'
		gene = Human.new "politician", 'gene wilder', 'republican'
		@people_list << jimbo
		@people_list << gene

		name_list.map do |name|
			random_party = party_list.sample
			name = Human.new "voter", name, random_party
			@people_list << name
		end

	end

	def delete
		puts "Name?"
		name = gets.chomp.downcase
		@people_list.delete_if { |person| person.name == name }
	end

	def get_update
		puts "Name?"
		og_name = gets.chomp.downcase
		@people_list.each do |x|
			if x.name == og_name
				puts "New name?"
				new_name = gets.chomp.downcase
				if x.party == "politician"
					puts "New Party?"
					party = gets.chomp.downcase
					x.update(new_name,party)
				else
					puts "New Politics?"
					party = gets.chomp.downcase
					x.update(new_name,party)
				end
			end
		end
	end
# method that checks of the new human added is a politician and what party he belongs to.
# If the party counter > 0, the user is reminded that there is a candidate already
	def politician_question
    first_question_type_loop_politician = true
    while first_question_type_loop_politician
			puts "Party? Democrat or Republican"
      party_answer = gets.chomp.downcase
      if party_answer == "democrat" && @candidate_counter_demo == 0
        @candidate_counter_demo += 1
      @name = Human.new "politician", @name, @party_answer
			@people_list << @name
      elsif party_answer == "republican" && @candidate_counter_repub == 0
        @candidate_counter_repub += 1
        @name = Human.new "politician", @name, @party_answer
        @people_list << @name
      else
        puts "You already have politician from that party"
      end

			first_question_type_loop_politician = false if @first_question_type_list.include? party_answer


    end
	end

	def first_question
		puts "What would you like to do? Create, Prepopulate, Delete, List, Update, or Vote"
		@first_question_answer = gets.chomp.downcase
		case @first_question_answer
			when "create"
				clear_screen
				first_question_type?
			when "prepopulate"
				clear_screen
				prepopulate_list
			when '1'
				clear_screen
				prepopulate_list
			when "list"
				clear_screen
				showlist
			when "update"
				clear_screen
				get_update
			when 'delete'
				delete
			when "vote"
				@game_state = 1
				game = VoteSim.new
				game.visit(@people_list)
				clear_screen
				put_line
				puts "Democratic Stump Speech"
				put_line
				game.stump_speech("democrat")
				put_line
				sleep(2)
				puts "Democratic Stump Votes"
				put_line
				game.stump
				sleep(4)
				clear_screen
				put_line
				puts "Republican Stump Speech"
				put_line
				game.stump_speech("republican")
				put_line
				sleep(2)
				puts "Republican Stump Votes"
				put_line
				game.stump
				sleep(4)
				clear_screen
				puts "Tally up votes"
				put_line
				game.check_votes
				game.cast_votes
				sleep(4)
				put_line
				put_line
				clear_screen
				sleep(2)
				game.show_results
		end
	end

#--------------------------------------------------------------------------------------------------------

  def voter_question
    first_question_type_loop_person = true
    while first_question_type_loop_person
		  puts "Politics? Liberal, Conservative, Tea Party, Socialist, or Neutral"
      politics_answer = gets.chomp.downcase
      @name = Human.new "voter", @name, politics_answer
		  @people_list << @name
      first_question_type_loop_person = false if @first_question_type_list.include? politics_answer
	  end
  end

  def first_question_type?
    puts "What would you like to create? Politician or Person"
    create_question = gets.chomp.downcase
    if create_question == "politician"
      puts "Name?"
      @name = gets.chomp.downcase
      politician_question
    else
      puts "Name?"
      @name = gets.chomp.downcase
      voter_question
    end
  end

#used to keep main menu looping until gamestate's number is changed
	def gamestate
		@game_state
	end

#***********************************************************************************************************
end
#END CLASS--------------------------------------------------------------------------------------------------