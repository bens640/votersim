class Human
	attr_accessor :type, :name, :party
	attr_writer :vote
	def initialize(type, name, party)
		@type = type
		@name = name
		@party = party
		@vote = ""
		@votes = 0
		@candidate = false
		# @votes = 0
	end

#--------------------------------------------------------------------------------------------------------
#methods for instance variables
#--------------------------------------------------------------------------------------------------------
	def type
		@type
	end

	def party
		@party
	end

	def name
		@name
	end

	def voters_choice
		@vote
	end
	def update_vote(new_vote)
		@vote = new_vote
	end

# def total_votes
#  @votes
# end
#--------------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------------
#class methods
#--------------------------------------------------------------------------------------------------------

#updates human with new info
	def update(name, party)
		@name = name
		@party = party
	end

#declares human as a candidate or not
	def candidate?
		@candidate = true if @type == "politician"
	end

#method to check get who the human will vote for, if its a politician- it will vote for itself
	def will_vote?(x)
		if @type == "politician"
			@vote = @party
			@votes = 1
		else
			@vote = x
		end
	end

	def add_vote
		@votes +=1
	end
#--------------------------------------------------------------------------------------------------------
#***********************************************************************************************************
end
#END CLASS--------------------------------------------------------------------------------------------------
class HumanList
	def initialize
		@list = []
	end

#--------------------------------------------------------------------------------------------------------
#methods for instance variables
#--------------------------------------------------------------------------------------------------------
	def voters
		@voter
	end
	def show_list
		@list
	end

#--------------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------------
#class methods
#--------------------------------------------------------------------------------------------------------
	def make_list(user_list)
		# ben = Human.new "voter", "ben", "tea party"
		# # ben.will_vote?("democrat")
		# bob = Human.new "politician", "bob", "democrat"
		# bob.will_vote?("glenn")
		# greg = Human.new "voter", "greg", "socialist"
		# # greg.will_vote?("democrat")
		# hope = Human.new "voter", "hope", "conservative"
		# # hope.will_vote?("republican")
		# mary = Human.new "politician", "mary", "republican"
		# mary.will_vote?("glenn")

		@list = user_list
		@list.each do |x|
			if x.type != "politician"
				@voter << x
			end
		end
	end

	def show_votes
		@list.each do |x|
			p x.voters_choice
		end
	end

#***********************************************************************************************************
end
#END CLASS--------------------------------------------------------------------------------------------------

# test = Peeps.new
# test.make_list
# test.show_list
# test.show_winner