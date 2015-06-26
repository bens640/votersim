require "./human.rb"

class MainMenu

  def initialize
    @game_state = 0
	  @first_question_answer = 0
    @human_counter = 0
    @first_question_answer_list = ["create", "list", "update"]
    #@end_loop_first = true
    @name = ""
    @people_list = []
    @first_question_type_list = ["politician", "person", "democrat", "republican", "liberal",
                                "conservative", "tea party", "socialist", "neutral", "ben" ]
  end
  #used to keep main menu looping until gamestate's number is changed
	def gamestate
		@game_state
	end
  def showlist
    @people_list.each do |x|
      puts "*#{x.type}, #{x.name}, #{x.party}"
    end
  end

	def politician_question
    first_question_type_loop_politician = true
    while first_question_type_loop_politician
			puts "Party? Democrat or Republican"
      party_answer = gets.chomp.downcase
			@name = Human.new "politician", @name, @party_answer
			@people_list << @name
      first_question_type_loop_politician = false if @first_question_type_list.include? party_answer
		end
	end

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

  def first_question
    # while @end_loop_first
      puts"What would you like to do? Create, List, Update, or Vote"
      @first_question_answer = gets.chomp.downcase
      # if @first_question_answer_list.include? @first_question_answer
	       case @first_question_answer
	          when "create"
		          first_question_type?
            when "list"
							showlist
            when "update"
							get_update
	          when "vote"
		          @game_state = 1
         end
      # end
		# end
	end
end


# x = MainMenu.new
# until x.gamestate == 1
# x.first_question
# end









