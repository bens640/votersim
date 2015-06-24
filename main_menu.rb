require "./human.rb"

class MainMenu

  def initialize
    @first_question_answer = 0
    @human_counter = 0
    @first_question_answer_list = ["create", "list", "update", "vote"]
    @end_loop_first = false
    #@create_question = ""
    @name = ""
    @party_answer = ""
    @politics_answer = ""
  end





  def first_question_type?
    first_question_type_loop = true
    first_question_type_loop_politician = true
    first_question_type_loop_person = true

    first_question_type_list = ["politician", "person", "democrat", "republican", "liberal",
                                     "conservative", "tea party", "socialist", "neutral" ]
    while first_question_type_loop
      puts "What would you like to create? Politician or Person"
      create_question = gets.chomp.downcase
      if first_question_type_list.include? create_question
        first_question_type_loop = false
      end
    end
    if create_question == "politician"
      puts "Name?"
      @name = gets.chomp.downcase
      while first_question_type_loop_politician
        puts "Party? Democrat or Republican"
        @party_answer = gets.chomp.downcase
        @name = Politician.new @name, @party_answer
        if first_question_type_list.include? @party_answer
          first_question_type_loop_politician = false
        end
        end
    else
      puts "Name?"
      @name = gets.chomp.downcase
      while first_question_type_loop_person
        puts "Politics? Liberal, Conservative, Tea Party, Socialist, or Neutral"
        @politics_answer = gets.chomp.downcase
        @name = Person.new @name, @politics_answer
        if first_question_type_list.include? @party_answer
        first_question_type_loop_person = false
        end
      end
    end
  end
  def first_question
    while !@end_loop_first
      puts"What would you like to do? Create, List, Update, or Vote"
      @first_question_answer = gets.chomp.downcase
      if @first_question_answer_list.include? @first_question_answer
        @end_loop_first = true
      end
    end
          case @first_question_answer
            when "create"
              first_question_type?
            when "list"
            when "update"
            when "vote"
          end
  end
end

x = MainMenu.new
x.first_question





