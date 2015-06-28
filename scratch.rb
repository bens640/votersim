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

def prepopulate_list
  name_list = ['ben shelomovitz', 'bob obobb', 'mary kate', 'kim possible', 'steve-o', 'jill and jack', 'veronica mars', 'danny trejo',
               'jon snow', 'mario anluigi', 'ed obannon', 'amy winehouse', 'juan jones', 'walter okiefe', 'fred love']
  party_list = ['tea party', 'conservative', 'neutral', 'liberal', 'socialist']
  jimbo = Human.new "politician", 'jimbo jones', 'democrat'
  gene = Human.new "politician", 'gene wilder', 'republican'
  people_list << jimbo
  people_list << gene

  name_list.map do |name|
    random_party = party_list.sample
    name = Human.new "voter", name, random_party
    people_list << name
  end


  def delete
    puts "Name?"
    name = gets.chomp.downcase
    people_list.each do |x|
      people_list.delete_if { |person| person == x.name }

    end
    puts people_list


  end


  prepopulate_list
  delete