require_relative '../config/environment'

##### teh shit going down here
system('clear')
puts "Hello! Welcome to VibeChecker 2. Plz press enter to begin"

input = gets.chomp
unless input == "n"
    event
end

system('clear')
star = "*"
i = 0

while i < 43
    puts star * i
    sleep(0.03)
    i += 1
end
while i > 0
    puts star * i
    sleep(0.03)
    i -= 1
end

puts "THANKS 4 VIBING, GOODBYE!"
