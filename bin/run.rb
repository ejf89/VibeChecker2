require_relative '../config/environment'

test = TwitterAdapter.new
test.call_twitter #<---runs search and stores into tweets

@checker = SentimentChecker.new
@checker.set_default


def collect_scores
     Tweet.where(query_id: Query.last.id).map do |tweet|
        @checker.score tweet.content
    end
end

scores = collect_scores
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

lastQuerystring = Query.last.search
vibeResult = declaration(average)
lastQuery = Query.last.id

Query.find_by(id: lastQuery).update(vibe: "#{vibeResult}")

puts "The Vibe is #{vibeResult} towards #{lastQuerystring}.\n\n"

def return_tweets #-needs to be added to CLI interaction
    Tweet.where(query_id: Query.last.id).limit(5).each do |tweet|
        puts "#{tweet.content}\n"
        puts "* * * * * * * * * * * * * * * * * * * * * * * * \n"
    end
end

return_tweets
