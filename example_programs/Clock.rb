# Digital clock
require 'time'
begin
    loop do
    system "clear"
    time = Time.new(%HH:%MM:%SS)
    puts time.strftime("%H:%M:%S")
    sleep(1)
end
rescue Interrupt
    puts "Exiting clock"
    exit 0
end
