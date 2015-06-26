require "./human.rb"
require "./main_menu.rb"


class VoteSim
	def initialize
	@list = []
	end
	def visit
		x =Peeps.new
		x.make_list
		@list = x.show_list
	end
	def comment

	end

	#Method for each human to cast votes => each person in list(a) will go through everybody in the list(b) including own self
	#if human in (b) is a candidate and its name matches matches (a)'s vote variable, (b)'s vote will increase by one
	def cast_votes
		@list.each do |x|
			@list.each do |y|
				p "#{y.name} has #{y.votes}" if y.candidate? == true && y.name == x.vote
			end
		end
	end
end






test = VoteSim.new

 test.visit
	test.cast_votes

# p x.polis
# p x.voters


repub_vote_list = [{party: "tea party", prob:90},{party: "conservative", prob:75},{party: "neutral", prob:50},
                   {party: "liberal", prob:25},{party: "socialist", prob:10}]

demo_vote_list = [{party: "tea party", prob:10},{party: "conservative", prob:25},{party: "neutral", prob:50},
                  {party: "liberal", prob:75},{party: "socialist", prob:90}]
