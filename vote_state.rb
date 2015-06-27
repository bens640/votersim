def stump_party_question(party_list, person)
  if person.type = "politician"
    puts "I, #{person.name}, will vote for myself"
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