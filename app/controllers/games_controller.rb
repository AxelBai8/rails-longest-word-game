require "open-uri"
class GamesController < ApplicationController

  def new
    alphabet = ('A'..'Z').to_a
    @letters = alphabet.sample(10)
  end

  def score
    @word = params[:word]
    url = "https://dictionary.lewagon.com/#{@word}"

    @response = URI.open(url).read
    @response = JSON.parse(@response)
    @english_word = @response

    if @english_word["found"]
      @message = "You win"
    else
      @message = "You lose"
      end
    end
  end
