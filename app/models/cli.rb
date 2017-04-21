def welcome
    system('clear')
    puts "Hello! Welcome to VibeChecker 2. Plz press enter to begin"

    input = gets.chomp
    unless input == "n"
        event
    end

    system('clear')

    star_grow
    star_shrink
end

def event
    star_grow

    tweet_adapter = TwitterAdapter.new
    tweet_adapter.call_twitter #<---runs search and stores into tweets

    @checker = SentimentChecker.new
    @checker.set_default

    scores = Tweet.collect_scores(@checker)
    if scores.length != 0
        @average = (scores.sum) / (scores.length)

        lastSearchstring = Search.last.search
        vibeResult = SentimentChecker.declaration(@average)
        lastSearch = Search.last.id

        Search.find_by(id: lastSearch).update(vibe: "#{vibeResult}", score: @average)#<--updates search table

        #sets color of vibeResult
        if vibeResult == "bad" || vibeResult == "very bad" || vibeResult == "pretty bad"
            vibeResult = Paint[vibeResult, :red]
        elsif vibeResult == "smoothly indifferent"
            vibeResult = Paint[vibeResult, :yellow]
        else
            vibeResult = Paint[vibeResult, :green]
        end

        @declare_vibe = "Currently, The Vibe is #{vibeResult} towards: #{lastSearchstring}.\n\n"

        star_shrink

        puts @declare_vibe
        puts "\nWould like you 2 know more bout the vibe: #{lastSearchstring}?\n
                *****(#{Paint['y', :green]}/n)*****"
        input = gets.chomp


        if input == "y"
          system('clear')
            puts "THESE TWEETS ARE VIBIN:"
            puts "~*~*~*~*~*~*~*~*~*~*~*~*~*~\n\n"
            Tweet.return_tweets(lastSearchstring, '@')
            puts "\n\n"
            Search.search_compare
        end
    else
        puts "An extremely unique vibe."
    end

    puts "\nWould you like 2 check another vibe?\n
    *****(y/n)*****"
    input = gets.chomp

    if input.chomp == "y"
        system('clear')
        event
    end

end

def star_grow
    star = Paint["*", :green]
    i = 0
    while i < 43
        puts star * i
        sleep(0.03)
        i += 1
    end
end

def star_shrink()
    star = Paint["*", :green]
    i = 43
    while i > 0
        puts star * i

        sleep(0.03)
        i -= 1
    end
end
