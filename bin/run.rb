require_relative '../config/environment'

top = TwitterAdapter.new
top.call_twitter #<---runs search and stores into tweets

@checker = SentimentChecker.new
@checker.set_default


# Tweet.collect_scores

# def collect_scores
#      Tweet.where(query_id: Search.last.id).map do |tweet|
#         @checker.score tweet.content
#     end
# end

scores = Tweet.collect_scores(@checker)
average = (scores.sum) / (scores.length)

def declaration(average)
    if average < (-1 * 0.1)
        "bad"
    elsif average > 0.05
        "good"
    else
        "indifferent"
    end
end

lastSearchstring = Search.last.search
vibeResult = declaration(average)
lastSearch = Search.last.id

Search.find_by(id: lastSearch).update(vibe: "#{vibeResult}")

puts "The Vibe is #{vibeResult} towards #{lastSearchstring}.\n\n"

#############################################################
def return_tweets #-needs to be added to CLI interaction
    Tweet.where(query_id: Search.last.id).limit(5).each do |tweet|
        puts "#{tweet.content}\n"
        puts "* * * * * * * * * * * * * * * * * * * * * * * * \n"
    end
end

puts "Would like you 2 know more bout de vibe?\n
        *****(y/n)*****"
input = gets.chomp

    if input == "y"
        return_tweets
    elsif input == "n"
        puts "Would you like 2 check another vibe?\n
        *****(y/n)*****"
    end
    #
    # if input == "y"
    #     top = TwitterAdapter.new
    #     top.call_twitter
    # end
