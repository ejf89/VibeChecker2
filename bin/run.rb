require_relative '../config/environment'



def event

    puts "Welcome to VibeChecker 2\n\n"
    star = "*"
    i = 0

    while i < 43
        puts star * i
        i += 1
    end

    top = TwitterAdapter.new
    top.call_twitter #<---runs search and stores into tweets

    @checker = SentimentChecker.new
    @checker.set_default

    scores = Tweet.collect_scores(@checker)
    @average = (scores.sum) / (scores.length)

    lastSearchstring = Search.last.search
    vibeResult = SentimentChecker.declaration(@average)
    lastSearch = Search.last.id

    Search.find_by(id: lastSearch).update(vibe: "#{vibeResult}")#<--updates search table

    statement = "Currently, The Vibe is #{vibeResult} towards #{lastSearchstring}.\n\n"
    i = statement.length
    while i > 0
        puts star * i
        i -= 1
    end
    puts statement


    puts "\nWould like you 2 know more bout de vibe: #{lastSearchstring}?\n
            *****(y/n)*****"
    input = gets.chomp

    if input == "y"
        Tweet.return_tweets
    end

    puts "\nWould you like 2 check another vibe?\n
    *****(y/n)*****"
    input = gets.chomp

    if input.chomp == "y"

        event
    end
end

##### teh shit going down here
input = gets.chomp

unless input == "n"
    event
end

puts "THANK YOU GOODBYE!"
