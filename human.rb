class Human
  attr_accessor :type, :name,:party

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
  def voters_vote
	  @vote
  end
  def update_vote(new_vote)
	  @vote = new_vote
  end
  def total_votes
	  @votes
  end
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
  def vote(x)
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
class Peeps
	def initialize
		@list = []
		@poli =[]
		@voter = []
		@repub_prob_list = []
		@demo_prob_list = []
	end

	#--------------------------------------------------------------------------------------------------------
	#methods for instance variables
	#--------------------------------------------------------------------------------------------------------
	def polis
		@poli
	end
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
	def make_list
		ben = Human.new "voter", "ben", "tea party"
    ben.vote("democrat")
    bob = Human.new "politician", "bob", "democrat"
		bob.vote("glenn")
		greg = Human.new "voter", "greg", "socialist"
    greg.vote("democrat")
    hope = Human.new "voter", "hope", "conservative"
    hope.vote("republican")
    mary = Human.new "politician", "mary", "republican"
		mary.vote("glenn")

		@list = [ben,bob,greg,hope,mary]
		 @list.each do |x|
			 if x.type == "politician"
				 @poli << x
			 else
				 @voter << x
			 end
		 end
	end
	#
	def show_votes
		@list.each do |x|
			p x.voters_vote
		end
	end
	#
	def show_winner
		@list.each do |x|
			p x.voters_vote
		end
	end
#***********************************************************************************************************
end
#END CLASS--------------------------------------------------------------------------------------------------

# test = Peeps.new
# test.make_list
# test.show_list
# test.show_winner
