class CLI
  def self.start(args)
    new.execute(args)
  end

  def execute(args)
    puts "Welcome to Goose Game!"
    puts "Commands:"
    puts "  roll - Roll the dice and move"
    puts "  quit - Exit the game"

    loop do
      print "> "
      command = gets.chomp

      case command
      when "roll"
        puts "Rolling the dice..."
      when "quit"
        puts "Thanks for playing!"
        break
      else
        puts "Unknown command. Use 'roll' or 'quit'"
      end
    end
  end
end 