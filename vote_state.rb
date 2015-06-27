require './human.rb'
list = []
def test(list)
	name_list = %w(ben bob mary jim steve jill veronica danny jon mario ed amy juan walter ed)
	party_list = ['tea party', 'conservative', 'neutral', 'liberal', 'socialist']
	name_list.map do |name|

		random_party = party_list.sample
		name = Human.new "voter", name, random_party
		list << name
	end
end
test(list)
puts list