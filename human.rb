class Politician
  attr_accessor :name,:party

  def initialize(name, party)
    @name = name
    @party = party
  end

  def party
    @party
  end

  def name
    @name
  end



end

class Person
  attr_accessor :name,:politics

  def initialize(name, politics)
    @name = name
    @politics = politics
  end

  def politics
    @politics
  end

  def name
    @name
  end
end



# def first_question_type?
#   puts "What would you like to create? Politician or Person"
#   create_question = gets.chomp.downcase
#   if create_question == "politician"
#     puts "Name?"
#     name = gets.chomp.downcase
#     puts "Party? Democrat or Republican"
#     party_answer = gets.chomp.downcase
#     name = Politician.new name, party_answer
#   else
#     puts "Name?"
#     name = gets.chomp.downcase
#     puts "Politics? Liberal, Conservative, Tea Party, Socialist, or Neutral"
#     politics_answer = gets.chomp.downcase
#     name = Person.new name, politics_answer
#   end
# end

# x =first_question_type?

# p x.name
