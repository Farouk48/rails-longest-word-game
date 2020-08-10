require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = (0...8).map { (65 + rand(26)).chr }.join
  end

  def score
    raise
    @letters = params[:letters].downcase.split('')
    @input = params[:word].split('')

    number_of_included_letters = @input.all? { |letter| @letters.include?(letter)}
    number_of_letters_in_word = @input.size
    letters_are_included = number_of_included_letters == number_of_letters_in_word
    if letters_are_included
      url = "https://wagon-dictionary.herokuapp.com/#{@input.join("")}"
      user_check = open(url).read
      answer = JSON.parse(user_check)
      word_exists = answer["found"]
      if word_exists
        @result = "congrats"
      else
        @result = "word doesn't exist"
      end
    else
        @result = "word doesn't use required letters"
    end

    #The word can’t be built out of the original grid
    #The word is valid according to the grid, but is not a valid English word
    #The word is valid according to the grid and is an English word
    #faire une requete get avec l'api

  end
end
