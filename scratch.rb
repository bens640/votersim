require './pickup.rb'
require "./human.rb"
##Eds Vote sim lecture
	#Domain Modeling
		#Classes: voter, politician, world, get_politician
#
# 		# require 'minitest/autorun'
# 		require "./human.rb"
#
# 		class World
# 			def initialize
# 				@list = []
# 			end
#
# 			def make
# 				@list << Human.new
# 			end
# 		end
#
# z=World.new
# p z
#
# # class VoterSimTest < MiniTest:: Test
# 	def test_world
# 		x = World.new
# 		assert x.make
# 		assert_equal 1, world.make.length
#
# 	end
# end

#
# repub = {
# 		"tea party"  => 90,
# 		"carp" => 4,
# 		"crucian"  => 3,
# 		"herring" => 6,
# 		"sturgeon" => 8,
# 		"gudgeon" => 10,
# 		"minnow" => 20
# }
#
# repub_prob = Pickup.new(repub)
# p repub_prob.pick(1)


def show_results(democrat_votes = 0, republican_votes = 0)
  ben = Human.new "voter", "ben", "tea party"
  bob = Human.new "politician", "bob", "democrat"
  greg = Human.new "voter", "greg", "socialist"
  hope = Human.new "voter", "hope", "conservative"
  mary = Human.new "politician", "mary", "republican"
  cindy = Human.new "voter", "cindy", "neutral"
  mindy = Human.new "voter", "mindy", "tea party"
  larry = Human.new "voter", "larry", "liberal"
  jerry = Human.new "voter", "jerry", "socialist"
  gary = Human.new "voter", "gary", "liberal"
  juan = Human.new "voter", "juan", "conservative"

  list = [ben, bob, greg, mary, hope, gary, mindy, cindy, larry, jerry, juan]

  if democrat_votes > republican_votes
    demo_winner = list.select( | x| (x.party == "democrat"))
    puts "With a total of #{democrat_votes} votes, #{demo_winner.name} win!"
  elsif republican_votes > democrat_votes
    puts "With a total of #{republican_votes} votes, Republicans win!"
  end

end

show_results(2, 1)