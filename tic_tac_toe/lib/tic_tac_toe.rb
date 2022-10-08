# Read: https://learn.co/lessons/tic-tac-toe-rb

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

class Player
  attr_accessor :name, :move

  def initialize(player_number)
    set_name(player_number)
    set_move(player_number)
  end

  private

  def set_name(player_number)
    print "Player #{player_number}, what is your name?  "
    @name = gets.chomp.capitalize
  end

  def set_move(player_number)
    case player_number
    when 1
      @move = 'O'
      puts "#{name}, you will be playing: " + @move
    when 2
      @move = 'X'
      puts "#{name}, you will be playing: " + @move
    end
    puts "\n"
    sleep(0.2)
  end
end

class TicTacToe
  attr_accessor :board

  def initialize(p1,p2)
    @p1 = p1
    @p2 = p2
    display_tutorial
    play
  end

  private

  def play
    player = @p1
    # start game
    until @game_over
      display_board(board)
      display_instructions

      print "#{player.name}(#{player.move}), pick an empty spot: "
      @user_input = gets.chomp

      if valid_move?
        board[@index] = player.move
        display_board(board)

        check_winner(player, board)
        check_draw(board)

        # Switch player at next turn
        player == @p1 ? player = @p2 : player = @p1
      else
        display_error_msg
      end
    end
    display_winner
    sleep(0.5)
    play_again?
  end

  def valid_move?
    input = @user_input.to_i
    @index = input.to_i - 1

    # Input is between 1 - 9 and spot is not occupied
    true if input.between?(1, 9) && !board[@index].match(/(X|O)/)
  end

  def display_error_msg
    puts "\n"
    puts 'Pick an empty spot with the numbers 1 to 9.'
    sleep(1)
  end

  def check_winner(player, board)
    win_combos = [
      # x-axis
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      # y-axis
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      # diagonal
      [0, 4, 8], [2, 4, 6]
    ]

    win_combos.each do |combo|
      arr = []
      combo.each do |index|
        arr << board[index]
      end

      # Uncomment to show processing...
      # puts 'Checking winning combos...'
      # print arr
      # puts "\n"
      # sleep(0.5)

      if arr.join.match(/#{player.move}{3}/)
        @winner = player
        @game_over = true

        # Uncomment to show processing
        # print "\nWinning combo:"
        # print arr
        # puts "\n"
        # puts "\n"
        # sleep(0.8)
        break
      end
    end
  end

  def check_draw(board)
    @game_over = true unless board.join.match(/[^(X|O)]/)
  end

  def display_winner
    unless @winner.nil?
      puts "#{@winner.name}(#{@winner.move}) won the game!!"
    else
      puts "It's a draw!"
    end
    puts "\n"
  end

  def display_instructions
    puts '[Type 1 - 9 to place your move]'
    puts "\n"
  end

  def display_board(board)
    clear_screen
    puts "\n"
    puts '     ----Tic Tac Toe----'
    puts "\n"
    puts "          #{board[0]} | #{board[1]} | #{board[2]} "
    puts '         ---+---+---'
    puts "          #{board[3]} | #{board[4]} | #{board[5]} "
    puts '         ---+---+---'
    puts "          #{board[6]} | #{board[7]} | #{board[8]} "
    puts "\n"
    puts '     -------------------'
    puts "\n"
  end

  def clear_screen
    print "\e[2J\e[f"
  end

  def display_tutorial
    board = %w[1 2 3 4 5 6 7 8 9]
    display_board(board)
    display_instructions
    puts '[Get 3 marks in a row to win!]'
    puts "\n"
    puts '[OK? Press Enter to begin the game!]'
    gets
    reset_board
  end

  def play_again?
    puts "Type 'Y' to play again."
    puts 'Type any other key to quit.'
    play_again = gets.chomp.downcase
    if play_again == 'y'
      TicTacToe.new(@p1,@p2)
    else
      display_board(board)
      puts '     Thank you for playing!'
      puts "\n"
    end
  end

  def reset_board
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end
end

Game.new
