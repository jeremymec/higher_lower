class Game < ApplicationRecord
  has_many :guesses

  LIVES_CONSTANT = 3

  def create_secret(game_id)
    secret = 1 + rand(10)
    game = Game.find(game_id)
    game.secretNum = secret
    game.save
  end

  def game_won(game_id)
      @game = Game.find(game_id)

      game_secret = @game.secretNum

      @game.guesses.each do |guess|
        guess_number = guess.number

        if (game_secret == guess_number)
          return true
        end
      end
        return false
  end

  def game_lost(game_id)
    @game = Game.find(game_id)

    return lives_left(game_id) < 1
  end

  def lives_left(game_id)
    @game = Game.find(game_id)

    game_secret = @game.secretNum
    lives = LIVES_CONSTANT

    @game.guesses.each do |guess|
      #byebug
      guess_number = guess.number

      #puts "#{game_secret} is the secret, #{guess_number} is the guess"

      if (game_secret == guess_number)
        puts "Game Won!"
      else
        puts "#{lives} are current, taking one away"
        lives = lives - 1
      end
    end
    return lives
  end

  def result(game_id)
    if game_lost(game_id)
      return "Defeat"
    elsif game_won(game_id)
      return "Victory"
    else
      return "Ongoing"
    end
  end


end
