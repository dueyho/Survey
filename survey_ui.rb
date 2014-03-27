require 'active_record'
require './lib/answer'
require './lib/question'
require './lib/survey'
require './lib/taker'

database_configuration = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configuration["development"]
ActiveRecord::Base.establish_connection(development_configuration)

def start_menu
  system 'clear'
  puts "Howdy!"
  choice = ""
  until choice == 'X'
    puts "D - for Designer"
    puts "S - for Survey Taker"
    choice = gets.chomp.upcase
    case choice
    when 'D'
      designer_menu
    when 'S'
      surveys
    when 'X'
      puts "Thanks for stopping by!"
    end
  end
end

def designer_menu
  puts "C - to create a new survey"
  puts "L - to see survey list and edit"
  choice = gets.chomp.upcase
  case choice
  when 'C'
    new_survey
  when 'L'
    designers_survey_list_and_edit
  end
end

def new_survey
  puts "What is survey name?"
  survey_name = gets.chomp
  if !(survey = Survey.create({:name => survey_name}))
    survey.errors.full_messages.each { |message| puts message }
  end
  puts "#{survey.name} has been created."
  choice = ''
  until choice == 'D'
    puts "'Q' to add a Question"
    puts "'D' if Done"
    choice = gets.chomp.upcase
    case choice
    when 'Q'
      #add_question_to_survey(survey)
      puts "What is the question"
      question_string = gets.chomp
      question = Question.create({:description => question_string, :survey_id => survey.id})
    when 'D'
      system 'clear'
      puts "Survey Complete"
      puts "Now what?"
      puts "'A' to add another survey"
      puts "'E' to go to edit survey menu"
      puts "'M' to go back to main designer menu"
      choicey = gets.chomp.upcase
      case choicey
        when 'A'
          system 'clear'
          new_survey
        when 'E'
          system 'clear'
          designers_survey_list_and_edit
        when 'M'
          system 'clear'
          designer_menu
      else
        system 'clear'
        puts "Bad choice. Going back to Main Menu"
        start_menu
      end
    end
  end
end

def designers_survey_list_and_edit
  puts "Choose a Survey"
  puts "\n"
  # show survey list
  puts "**********************"
  puts "\n"
  Survey.all.each_with_index do |survey, index|
    puts "** #{index + 1}: #{survey.name}"
  end
  puts "\n"
  puts "** Enter number corresponding to survey to edit survey"
  puts "\n"
  puts "**********************"

  survey_choice = gets.chomp.to_i
  survey = Survey.all[survey_choice - 1]
  choice = ''
  until choice == 'D'
    puts "'L' - to see a List of Questions"
    puts "'Q' - to add another Question to #{survey.name}"
    puts "'E' - to edit existing question of #{survey.name}"
    puts "'D' - to go back to main Designer menu"


    edit_choice = gets.chomp.upcase
    case edit_choice
    when 'L'
      system 'clear'
      questions = Question.where({:survey_id => survey.id})
      questions.each_with_index do |question, i|
        puts "#{i+1}: #{question.description}"
      end
      puts "\n***********************\n"
    when 'Q'
      #add_question_to_survey(survey)
      puts "What is the question"
      question_string = gets.chomp
      question = Question.create({:description => question_string, :survey_id => survey.id})
      puts "Question created."
    when 'E'
      edit_question(survey)
    when 'D'
      designer_menu
    else
      puts "Try Again"
    end
  end
end

def edit_question(survey)
  questions = Question.where({:survey_id => survey.id})
  questions.each_with_index do |question, i|
    puts "#{i+1}: #{question.description}"
  end
  puts "\n***********************\n"
  puts "Which question do you want to edit? choose number"
  edit_input = gets.chomp.to_i
  puts "Enter the new question description"
  new_question = gets.chomp
  question = Question.all[edit_input]
  question.update({:description => new_question})
  #Question.update(Question.all[edit_input -1],{ :description => new_question})
  puts "Question #{edit_input} has been redescribed to #{new_question}"
end

start_menu
