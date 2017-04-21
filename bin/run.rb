require_relative '../config/environment'

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
    star = Paint[star, :green]
    sleep(0.03)
    i += 1
end
while i > 0
    puts star * i
    sleep(0.03)
    i -= 1
end

puts "#{Paint['THANKS', :blue]} 4 #{Paint['V~I~B~I~N~G', :yellow]}, GOODBYE!"
