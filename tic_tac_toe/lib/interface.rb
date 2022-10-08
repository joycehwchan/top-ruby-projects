require_relative 'player'
require_relative 'tic_tac_toe'

class Game
  def initialize
    display_title
    set_up_players
    TicTacToe.new(@p1,@p2)
  end

  private

  def set_up_players
    @p1 = Player.new(1)
    @p2 = Player.new(2)
    ready_to_start
  end

  def display_title
    print "\e[2J\e[f"
    puts "\n"
    puts '     ----Tic Tac Toe----'
    puts "\n"
    puts '          O | X | O '
    puts '         ---+---+---'
    puts '          O | O | X '
    puts '         ---+---+---'
    puts '          X | X | O '
    puts "\n"
    puts '     -------------------'
    puts "\n"
  end

  def ready_to_start
    sleep(0.2)
    puts 'Are you ready? Press Enter to start!'
    gets
    sleep(0.1)
  end
end

Game.new
