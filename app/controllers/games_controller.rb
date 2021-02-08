require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('a'..'z').to_a.sample }
    @letters
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:score]}"
    words = open(url).read
    @word = JSON.parse(words)
    @score = 0
    if @word['found'] == false
      @display = "Sorry but #{params[:score].upcase} can't be built out of #{params[:letters]}"
    elsif @word['found'] == true && @word['error'] == 'word not found'
      @display = "Sorry but #{params[:score].upcase} does not seem to be a valid English word..."
    elsif @word['found'] == true
      @display = "Congratulations! #{params[:score].upcase} is a valid English word!"
      @score = "Your score is #{@word['length']}!"
    end
  end
end
