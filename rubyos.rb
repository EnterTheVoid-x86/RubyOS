# Operating system in Ruby
puts "RubyOS starting up..."
def os_start
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
  puts "RubyOS started.".colorize(:red)
end

os_start

def main
  print "> ".colorize(:red)
  input = gets.chomp
  if input == "help"
    help
  elsif input == "exit"
    exit
  elsif input == "date"
    date
  elsif input == "time"
    time
  elsif input == "calculator"
    calculator
  elsif input == "calculator_help"
    calculator_help
  elsif input == "print"
    puts "Print what?"
    prin = gets.chomp
    print prin
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
  puts "linux - opens a bash shell"
  puts ""
  puts "Commands can be programmed using Ruby Scripts and typing in the Load command."
  puts "Example: load (input file name in next screen)"
  puts "This will load the file and execute it."
end

def date
  puts "It is #{Time.now.strftime("%A")} the #{Time.now.strftime("%d")} of #{Time.now.strftime("%B")} #{Time.now.strftime("%Y")}."
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
    exit
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

begin
  loop do
  main
end
rescue Interrupt
  retry
rescue NoMethodError
  puts "Exiting RubyOS..."
  exit 0
end

