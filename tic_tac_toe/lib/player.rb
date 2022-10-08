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
