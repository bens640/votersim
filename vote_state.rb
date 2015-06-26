require "./human.rb"


class VoteState

  def initialize
      @choice =
  end

  def get_type

  end


end


# If a politician is a Republican, he has a
# - 90% chance of convincing a Tea Party voter to vote for him
# - 75% chance of convincing a Conservative voter to vote for him
# - 50% chance of convincing a Neutral voter to vote for him
# - 25% chance of convincing a Liberal voter to vote for him
# - 10% chance of convincing a Socialist voter to vote for him
#
# If a politician is a Democrat, he has a
# - 90% chance of convincing a Socialist voter to vote for him
# - 75% chance of convincing a Liberal voter to vote for him
# - 50% chance of convincing a Neutral voter to vote for him
# - 25% chance of convincing a Conservative voter to vote for him
# - 10% chance of convincing a Tea Party voter to vote for him

repub_vote_list = {"tea party": 90, party: "conservative", prob:75},{party: "neutral", prob:50},
                   party: "liberal", prob:25},{party: "socialist", prob:10}

demo_vote_list = [{party: "tea party", prob:10},{party: "conservative", prob:25},{party: "neutral", prob:50},
                   {party: "liberal", prob:75},{party: "socialist", prob:90}]




