# Create a clock in the middle of the screen with red text
require 'colorize'
time = Time.new
width = `tput cols`.to_i
begin
    loop do
        system "clear"
        time = Time.new
        puts time.strftime("%H:%M:%S").colorize(:red).center(width + 15)
        sleep 1
    end
rescue Interrupt
    puts "Exiting clock..."
exit 0
end