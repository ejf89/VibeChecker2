def event
    star = "*"
    i = 0

    while i < 43
        puts star * i
        sleep(0.03)
        i += 1
    end

    top = TwitterAdapter.new
    top.call_twitter #<---runs search and stores into tweets

    @checker = SentimentChecker.new
    @checker.set_default

    scores = Tweet.collect_scores(@checker)
    if scores.length != 0#-- wrapped up everything below into this if
        @average = (scores.sum) / (scores.length)

        lastSearchstring = Search.last.search
        vibeResult = SentimentChecker.declaration(@average)
        lastSearch = Search.last.id

        Search.find_by(id: lastSearch).update(vibe: "#{vibeResult}", score: @average)#<--updates search table

        #sets color of vibeResult
        if vibeResult == "bad" || vibeResult == "very bad"
            vibeResult = Paint[vibeResult, :red]
        elsif vibeResult == "smoothly indifferent"
            vibeResult = Paint[vibeResult, :yellow]
        else
            vibeResult = Paint[vibeResult, :green]
        end

        statement = "Currently, The Vibe is #{vibeResult} towards: #{lastSearchstring}.\n\n"
        i = statement.length
        while i > 0
            puts star * i
            sleep(0.03)
            i -= 1
        end
        puts statement

        puts "\nWould like you 2 know more bout the vibe: #{lastSearchstring}?\n
                *****(#{Paint['y', :green]}/#{Paint['n', :red]})*****"
        input = gets.chomp

        if input == "y"
          system('clear')
            puts "THESE TWEETS ARE VIBIN:"
            puts "~*~*~*~*~*~*~*~*~*~*~*~*~*~\n\n"
            Tweet.return_tweets
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
