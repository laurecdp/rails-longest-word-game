class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a
    @letters_to_display = 
  end

  def score
  end
end
