class Human
  attr_accessor :type, :name,:party

  def initialize(type, name, party)
    @type = type
	  @name = name
    @party = party
		@vote = ""
		@votes = 0
		@candidate = false
  end
	def type
		@type

	end
  def party
    @party

  end

  def name
    @name
  end
#method to check get who the human will vote for, if its a politician- it will vote for itself
  def vote(x)
		if @type == "politician"
			@vote = @name
		else
      @vote = x
		end
  end
  def votes
		@votes +=1
  end
#declares human as a candidate or not
  def candidate?
	  @candidate = true if @type == "politician"
  end
#updates human with new info
  def update(name, party)
    @name = name
    @party = party
  end

end

class Peeps
	def initialize
		@list = []

		@poli =[]
		@voter = []
		@repub_prob_list = []
		@demo_prob_list = []
	end

	def make_list
		ben = Human.new "voter", "ben", "neutral"
    ben.vote("bob")
    bob = Human.new "politician", "bob", "democrat"
		greg = Human.new "voter", "greg", "socialist"
    greg.vote(bob)
    hope = Human.new "voter", "hope", "liberal"
    hope.vote("mary")
    mary = Human.new "politician", "mary", "republican"

		@list = [ben,bob,greg,hope,mary]
		@list.each do |x|
			(x.type == "politician") ? @poli << x : @voter << x
		end
	end

	def show_list
		@list
	end


	def polis
		@poli

	end

	def voters
		@voter
	end

end


