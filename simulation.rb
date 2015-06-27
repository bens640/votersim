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

  def democratic_candidate
    @list.each do |x|
      x.name if x.party == "democrat"
    end
  end

  def republican_candidate
    @list.each do |x|
      x.name if x.party == "republican"
    end
  end

# Method to initialize the voters list
  def visit(user_list)
    @list = user_list
  end

#Method that runs the voters candidate choice through the probability that choice will be changed
  def stump_party_question(party_list, person)
    if person.type == "politician"
      puts "I, #{person.name}, will vote for myself"
      if person.vote == "democrat"
        @democrat_votes += 1
      else
        @republican_votes += 1
      end
    else
      list = Pickup.new(party_list)
      new_vote = list.pick(1)
      if person.voters_choice != new_vote
        puts "i have changed my vote to the #{new_vote} party"
        person.vote = new_vote
      else
        puts "I have stayed in my party"
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

#Method to output each voters current choice of candidate
	def check_votes
    @list.each do |x|
      p "#{x.name} voted for #{x.voters_choice}"
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
        @d_winner = x.name.capitalize
      elsif x.party == "republican"
        @r_winner = x.name.capitalize
      end
    end
    if @democrat_votes > @republican_votes
      puts "With a total of #{@democrat_votes} votes, #{@d_winner} wins!"
		elsif @republican_votes > @democrat_votes
      puts "With a total of #{@republican_votes} votes, #{@r_winner} wins!"
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






