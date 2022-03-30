# RubyOS 2.0, created by etvx86
puts "RubyOS starting up..."
def os_start
  system "gem install colorize fileutils > /dev/null"
  require 'colorize'
  puts "Colors module loaded.".colorize(:green)
  require 'time'
  puts "Time module loaded.".colorize(:green)
  require 'fileutils'
  puts "FileUtils module loaded.".colorize(:green)
  puts 'date: ' + Time.now.to_s
  puts 'time: ' + Time.now.strftime("%H:%M:%S")
  puts 'day: ' + Time.now.strftime("%A")
  puts 'month: ' + Time.now.strftime("%B")
  puts 'year: ' + Time.now.strftime("%Y")
  puts "Directory listing:" 
  system("ls")
  puts "RubyOS Timestamp is: #{Time.now.to_i}"
  puts "RubyOS started.".colorize(:red)
end

os_start

$passfile = "rubyos"

def main
  print " ".colorize(:red)
  input = gets.chomp
  if input == "help"
    help
  elsif input == "exit"
    puts "Exiting..."
    puts "RubyOS 2.0"
    passprompt
  elsif input == "date"
    date
  elsif input == "time"
    time
  elsif input == "timestamp"
    puts Time.now.to_i
  elsif input == "calculator"
    calculator
  elsif input == "calculator_help"
    calculator_help
  elsif input == "print"
    puts "Print what?"
    prin = gets.chomp
    printf prin
  elsif input == "cls" or input == "clear"
    system "clear"
  elsif input == "load"
    puts "What command do you want to load?"
    load = gets.chomp
    system "ruby #{load}"
  elsif input == "linux"
    puts "Entering bash..."
    puts "Type 'exit' to exit bash."
    system "bash"
  elsif input == "mkdir"
    puts "Enter folder name to be created"
    folder = gets.chomp
    system "mkdir #{folder}"
  elsif input == "rmdir"
    puts "Enter folder name to be deleted"
    folder = gets.chomp
    system "rmdir #{folder}"
  elsif input == "touch"
    puts "Enter file name to be created"
    file = gets.chomp
    system "touch #{file}"
  elsif input == "rm"
    puts "Enter file name to be deleted"
    file = gets.chomp
    system "rm #{file}"
  elsif input == "ls"
    system "ls"
  elsif input == "cd"
    puts "Enter directory name"
    dir = gets.chomp
    FileUtils.cd(dir)
  elsif input == "cat"
    puts "Enter file name"
    file = gets.chomp
    system "cat #{file}"
  elsif input == "cp"
    puts "Enter file name"
    file = gets.chomp
    puts "Enter destination"
    dest = gets.chomp
    system "cp #{file} #{dest}"
  elsif input == "mv"
    puts "Enter file name"
    file = gets.chomp
    puts "Enter destination"
    dest = gets.chomp
    system "mv #{file} #{dest}"
  elsif input == "games"
     games
  elsif input == "sysinfo"
    puts "RubyOS 2.0"
    # Print the uptime
    puts "Uptime:"
    system "bash example_programs/uptime.sh"
    system('cat /proc/meminfo | grep MemTotal')
    puts "CPU: #{@cpu}"
    puts "Network: #{@network}"
    puts "Storage: #{@storage}"
    puts "*******           **              
/**////**         /**       **   **
/**   /**  **   **/**      //** ** 
/*******  /**  /**/******   //***  
/**///**  /**  /**/**///**   /**   
/**  //** /**  /**/**  /**   **    
/**   //**//******/******   **     
//     //  ////// /////    //      
         *******    ********       
        **/////**  **//////        
       **     //**/**              
      /**      /**/*********       
      /**      /**////////**       
      //**     **        /**       
       //*******   ********        
        ///////   ////////"
else
    puts "Command not recognized."
end
end

def help
  puts "help - displays this help message"
  puts "exit - exits RubyOS"
  puts "date - displays the current date"
  puts "time - displays the current time"
  puts "calculator - opens the calculator"
  puts "calculator_help - displays help for the calculator"
  puts "print - prints whatever you type, or does simple math"
  puts "timestamp - prints RubyOS timestanp"
  puts "cls/clear - clears the screen"
  puts "mkdir - creates a directory"
  puts "rmdir - deletes a directory"
  puts "touch - creates a file"
  puts "rm - deletes a file"
  puts "ls - lists the contents of the current directory"
  puts "cd - changes the current directory"
  puts "cat - displays the contents of a file"
  puts "cp - copies a file"
  puts "mv - moves a file"
  puts "games - play some games!"
  puts "linux - opens a bash shell"
  puts "sysinfo - prints RubyOS sysinfo"
  puts "---PASSWORD INFO---"
  puts "Your password is defined in the $passfile variable."
  puts "You can use this to set a password in the login screen that shows when you type exit into the console."
  puts "-------------------"
  puts ""
  puts "Commands can be programmed using Ruby Scripts and typing in the Load command."
  puts "Example: load (input file name in next screen)"
  puts "This will load the file and execute it."
end

def date
  puts "It is #{Time.now.strftime("%A")} the #{Time.now.strftime("%d")} of #{Time.now.strftime("%B")} #{Time.now.strftime("%Y")}."
end

def passprompt
  loop do
    puts "Please enter your password: "
    passwd = gets.chomp
    if passwd == $passfile
      then
        puts "Welcome to RubyOS."
        maii
      else
        puts 'Wrong password!'
    end
end
end

def time
  puts "It is #{Time.now.strftime("%H:%M:%S")}."
end

def calculator
  puts "Calculator starting up..."
  puts "Calculator help:"
  calculator_help
  puts "Enter a command:"
  print "> ".colorize(:light_blue)
  input = gets.chomp
  if input == "help"
    calculator_help
  elsif input == "exit"
    puts "Exiting..."
  elsif input == "add"
    add
  elsif input == "subtract"
    subtract
  elsif input == "multiply"
    multiply
  elsif input == "divide"
    divide
end
end


def calculator_help
  puts "help - displays this help message"
  puts "exit - exits the calculator"
  puts "add - adds two numbers"
  puts "subtract - subtracts two numbers"
  puts "multiply - multiplies two numbers"
  puts "divide - divides two numbers"
end

def add
  puts "What is the first number?"
  print "> "
  first_number = gets.chomp
  puts "What is the second number?"
  print "> "
  second_number = gets.chomp
  puts "The sum of #{first_number} and #{second_number} is #{first_number.to_i + second_number.to_i}."
end

def subtract
  puts "What is the first number?"
  print "> "
  first_number = gets.chomp
  puts "What is the second number?"
  print "> "
  second_number = gets.chomp
  puts "The difference of #{first_number} and #{second_number} is #{first_number.to_i - second_number.to_i}."
end

def multiply
  puts "What is the first number?"
  print "> "
  first_number = gets.chomp
  puts "What is the second number?"
  print "> "
  second_number = gets.chomp
  puts "The product of #{first_number} and #{second_number} is #{first_number.to_i * second_number.to_i}."
end

def divide
  puts "What is the first number?"
  print "> "
  first_number = gets.chomp
  puts "What is the second number?"
  print "> "
  second_number = gets.chomp
  puts "The quotient of #{first_number} and #{second_number} is #{first_number.to_i / second_number.to_i}."
end

def games
  puts "Which game do you want to play?"
  puts "1. NumberGuess"
  puts "2. Rock, Paper, Scissors"
  puts "3. Exit"
  print "> ".colorize(:light_blue)
  input = gets.chomp
  if input == "1"
    numguess
  elsif input == "2"
    rock_paper_scissors
  elsif input == "3"
  main
  else
    puts "Invalid input."
    games
  end
end

def numguess
  puts "Welcome to Number Guess!"
  random_number = rand(1..100)
  puts "I'm thinking of a number between 1 and 100."
  puts "Try to guess it!"
  puts "You have 4 tries."
  puts "What is your first guess?"
  print "> ".colorize(:light_blue)
  guess = gets.chomp.to_i
  puts "Your guess is #{guess}."
  if guess == random_number
    puts "You guessed correctly!"
  else
    puts "You guessed incorrectly!"
    puts "You have 3 guesses left."
    puts "What is your second guess?"
    print "> ".colorize(:light_blue)
    guess = gets.chomp.to_i
    puts "Your guess is #{guess}."
    if guess == random_number
      puts "You guessed correctly!"
    else
      puts "You guessed incorrectly!"
      puts "You have 2 guesses left."
      puts "What is your third guess?"
      print "> ".colorize(:light_blue)
      guess = gets.chomp.to_i
      puts "Your guess is #{guess}."
      if guess == random_number
        puts "You guessed correctly!"
      else
        puts "You guessed incorrectly!"
        puts "You have 1 guess left."
        puts "What is your final guess?"
        print "> ".colorize(:light_blue)
        guess = gets.chomp.to_i
        puts "Your guess is #{guess}."
        if guess == random_number
          puts "You guessed correctly!"
        else
          puts "You guessed incorrectly!"
          puts "You have no more guesses left."
          puts "The number was #{random_number}."
        end
      end
    end
  end

  

end

def rock_paper_scissors
  print "Please choose one - rock, paper or scissors: "
  $input = gets.chomp

  $user_input = $input.downcase

  puts "You chose #{$user_input}."

  #defining which choice computer makes
  def computer_choice
    cc = (1 + rand(3))

    case cc
    when 1
      $choice = "rock"
    when 2
      $choice = "paper"
    when 3
      $choice = "scissors"
    end
  end

  computer_choice

  #comparing computer choice against user choice
  if $user_input == $choice
    puts "I chose #{$choice} too. It's a tie. Let's try again."
    rock_paper_scissors
  else
    if $user_input == "rock" && $choice == "paper"
      puts "I chose paper. Paper wraps rock. I win."
    elsif $user_input == "rock" && $choice == "scissors"
      puts "I chose scissors. Rock destroys scissors. You win."
    elsif $user_input == "paper" && $choice == "rock"
      puts "I chose rock. Paper wraps rock. You win."
    elsif $user_input == "paper" && $choice == "scissors"
      puts "I chose scissors. Scissors cut paper. I win."
    elsif $user_input == "scissors" && $choice == "rock"
      puts "I chose rock. Rock destroys scissors. I win."
    elsif $user_input == "scissors" && $choice == "paper"
      puts "I chose paper. Scissors cut paper. You win."
    else
      puts "I didn't understand you. Please try again."
      rock_paper_scissors
    end #end nested if statement
  end #end if statement
end #end game def

def maii
  begin
  loop do
  main
end
rescue Interrupt
  retry
rescue NoMethodError
  puts "Shutting down..."
  sleep 0.5
  exit 0
rescue (Errno::ENOENT)
  puts "An error occurred."
  retry
end
end

maii

