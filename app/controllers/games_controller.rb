require "open-uri"


class GamesController < ApplicationController

  def new
    @letters = Array.new(10) { ('a'..'z').to_a.sample }
  end

  def score
    @letters = params[:letters].split
    @word = params[:word]

    url = "https://dictionary.lewagon.com/#{@word}"
    word_serialized = URI.parse(url).read
    result = JSON.parse(word_serialized)
    @english_word = result["found"]
    # we need to check if all the letters in the word are in the letters array
    # store it in a variable then use in the view
    @in_grid = @word.chars.all? { |char| @letters.include?(char) }



  end
end
