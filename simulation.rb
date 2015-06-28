require "./human.rb"
require './pickup.rb'

class VoteSim
	def initialize
	@list = []
	@x = Object.new
	@winner = ""
  @voters = []
  @democrat_votes = 0
  @republican_votes = 0
  @test_list = []
	end

	#Method to capitalize both first and last name of humans
  def capitalize(text)
	  text.split.map(&:capitalize).join(' ')
  end

	def democratic_candidate
    @list.each do |x|
      capitalize(x.name) if x.party == "democrat"
    end
  end

  def republican_candidate
    @list.each do |x|
      capitalize(x.name) if x.party == "republican"
    end
  end

# Method to initialize the voters list
  def visit(user_list)
    @list = user_list
  end

#Method that runs the voters candidate choice through the probability that choice will be changed
  def stump_party_question(party_list, person)
    if person.type == "politician"
      puts "I, #{capitalize(person.name)}, will vote for myself"
      if person.vote == "democrat"
        @democrat_votes += 1
      else
        @republican_votes += 1
      end
    else
      list = Pickup.new(party_list)
      new_vote = list.pick(1)
      if person.voters_choice != new_vote
        puts "  I, #{capitalize(person.name)}, have changed my vote to the #{new_vote} party"
        person.vote = new_vote
      else
        puts "  I, #{capitalize(person.name)}, have stayed in my party"
      end
    end
  end

#Method that uses case/when to run stump question for the voters political party
  def stump
		tea_party_list = {"republican" =>90, "democrat" =>10}
		conservative_list ={"republican" =>75, "democrat" =>25}
		neutral_list ={"republican" =>50, "democrat" =>50}
		liberal_list ={"republican" =>25, "democrat" =>75}
		socialist_list = {"republican" =>10, "democrat" =>90}

    @list.each do |voter|
	    if voter.candidate?
		    puts "  I, #{capitalize(voter.name)}, will vote for myself! I will show you what a true politician is! MUAHAHAHAHA!"
	    else
		    case voter.party
						when "tea party"
	            stump_party_question(tea_party_list, voter)
						when "conservative"
	            stump_party_question(conservative_list, voter)
						when "neutral"
	            stump_party_question(neutral_list, voter)
						when "liberal"
	            stump_party_question(liberal_list, voter)
	        when "socialist"
	          stump_party_question(socialist_list, voter)
		    end
	    end
		end
  end

#Method to output each voters current choice of candidate
	def check_votes
    @list.each do |voter|
	    if voter.candidate?
		    puts "I, #{capitalize(voter.name)}, have voted for myself!"
	    else
	    p "#{capitalize(voter.name)} voted for the #{capitalize(voter.voters_choice)}"
			end
    end
	end

#Method for each voter to cast their vote for their candidate
	def cast_votes
    @list.each do |x|
      if x.voters_choice == "democrat"
				@democrat_votes += 1
			else
				@republican_votes += 1

			end
		end
	end

#Method to compare number of votes for each candidate and outputs winner
	def show_results

    @list.each do |x|
      if x.party == "democrat"
        @d_winner = capitalize(x.name)
      elsif x.party == "republican"
        @r_winner = capitalize(x.name)
      end
    end
    if @democrat_votes > @republican_votes
      puts "With a total of #{@democrat_votes} votes, #{@d_winner} wins!"
			puts "As you new democratic president, I ,#{@d_winner}, promise to serve you after serving myself"
		elsif @republican_votes > @democrat_votes
      puts "With a total of #{@republican_votes} votes, #{@r_winner} wins!"
		end
			puts "As your new Republican President, I, #{@r_winner}, promise to uphold everything in the constitution as long as it doesn't interfere with my interests"
	end

  def stump_speech(party)
    if party == "democrat"
      puts "Please vote for me! I will do everything you ask and more. Dont listen to my opponent, he knows nothing!"
    else
      puts "As your republican candidate for president, i will take care of each and every one of you. What my rival forgets is that winter is coming!"
    end

  end


#***********************************************************************************************************
end
#END CLASS--------------------------------------------------------------------------------------------------


# test = VoteSim.new
# test.usertestlist
# # test.visit(@list)
# test.check_votes
# test.stump
# test.check_votes
# test.cast_votes
# test.show_results
#






