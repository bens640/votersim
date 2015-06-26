require "./human.rb"

require './pickup.rb'

class VoteSim
	def initialize
	@list = []
	@x = Object.new
	@winner = ""
	@polis = []
		@voters = []
	end
	def visit
		@x = Peeps.new
		@x.make_list
		@list = @x.show_list
		@polis = @x.polis
		@voters = @x.voters
		@democrat_votes = 0
		@republican_votes = 0
	end
	def comment
			@list
	end
	def stump
		tea_party_list = {"republican" =>90, "democrat" =>10}
		conservative_list ={"republican" =>75, "democrat" =>25}
		neutral_list ={"republican" =>50, "democrat" =>50}
		liberal_list ={"republican" =>25, "democrat" =>75}
		socialist_list = {"republican" =>10, "democrat" =>90}

		@voters.each do |voter|
			case voter.party
					when "tea party"
						tea_party = Pickup.new(tea_party_list)
						new_vote = tea_party.pick(1)
						if voter.voters_vote != new_vote
							puts "i have changed my vote to the #{new_vote} party"
							voter.party = new_vote
						else
							puts "I have stayed in my party"
						end
					when "conservative"
						conservative = Pickup.new(conservative_list)
						new_vote = conservative.pick(1)
						if voter.voters_vote != new_vote
							puts "i have changed my vote to the #{new_vote} party"
							voter.party = new_vote
						else
							puts "I have stayed in my party"
						end
					when "neutral"
						neutral = Pickup.new(neutral_list)
						new_vote = neutral.pick(1)
						if voter.voters_vote != new_vote
							puts "i have changed my vote to the #{new_vote} party"
							voter.party = new_vote
						else
							puts "I have stayed in my party"
						end
					when "liberal"
						liberal = Pickup.new(liberal_list)
						new_vote = liberal.pick(1)
						if voter.voters_vote != new_vote
							puts "i have changed my vote to the #{new_vote} party"
							voter.party = new_vote
						else
							puts "I have stayed in my party"
						end
					when "socialist"
					socialist = Pickup.new(socialist_list)
					new_vote = socialist.pick(1)
					if voter.voters_vote != new_vote
						puts "i have changed my vote to the #{new_vote} party"
						voter.party = new_vote
					else
						puts "I have stayed in my party"
					end

			end
		end
	end
	def stump2
		tea_party_list = {"republican" =>10, "democrat" =>90}
		conservative_list ={"republican" =>25, "democrat" =>75}
		neutral_list ={"republican" =>50, "democrat" =>50}
		liberal_list ={"republican" =>75, "democrat" =>25}
		socialist_list = {"republican" =>90, "democrat" =>10}

		@voters.each do |voter|
			case voter.party
				when "tea party"
					tea_party = Pickup.new(tea_party_list)
					new_vote = tea_party.pick(1)
					if voter.voters_vote != new_vote
						puts "i have changed my vote to the #{new_vote} party"
						voter.update_vote(new_vote)
					else
						puts "I have stayed in my party"
					end
				when "conservative"
					conservative = Pickup.new(conservative_list)
					new_vote = conservative.pick(1)
					if voter.voters_vote != new_vote
						puts "i have changed my vote to the #{new_vote} party"
						voter.update_vote(new_vote)
					else
						puts "I have stayed in my party"
					end
				when "neutral"
					neutral = Pickup.new(neutral_list)
					new_vote = neutral.pick(1)
					if voter.voters_vote != new_vote
						puts "i have changed my vote to the #{new_vote} party"
						voter.update_vote(new_vote)
					else
						puts "I have stayed in my party"
					end
				when "liberal"
					liberal = Pickup.new(liberal_list)
					new_vote = liberal.pick(1)
					if voter.voters_vote != new_vote
						puts "i have changed my vote to the #{new_vote} party"
						voter.update_vote(new_vote)
					else
						puts "I have stayed in my party"
					end
				when "socialist"
					socialist = Pickup.new(socialist_list)
					new_vote = socialist.pick(1)
					if voter.voters_vote != new_vote
						puts "i have changed my vote to the #{new_vote} party"
						voter.update_vote(new_vote)
					else
						puts "I have stayed in my party"
					end

			end
		end
	end

	def check_votes
		@voters.each do |x|
			p "#{x.name} voted for #{x.voters_vote}"
		end
	end
	#Method for each voter to vote on each candidate
	def cast_votes
		@voters.each do |x|
			if x.voters_vote == "democrat"
				@democrat_votes += 1
			else
				@republican_votes += 1

			end
		end
	end

	def show_results
		if @democrat_votes > @republican_votes
			puts "democrat wins"
		elsif @republican_votes > @democrat_votes
			puts "republicans win"
		end

	end

end





# test = VoteSim.new
# test.visit
#
# test.check_votes
# test.stump
# test.stump2
# test.check_votes

# test.cast_votes
# test.show_results







