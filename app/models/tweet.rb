class Tweet < ActiveRecord::Base
    belongs_to :search

    def self.collect_scores(checker)
        # binding.pry
         self.where(query_id: Search.last.id).map do |tweet|

            tweet_score = checker.score tweet.content
            tweet.update(score: tweet_score)
            tweet_score
        end
    end

    def self.return_tweets #-needs to be added to CLI interaction
        self.where(query_id: Search.last.id).limit(5).each do |tweet|
            puts "#{tweet.content}\n"
            puts "* * * * * * * * * * * * * * * * * * * * * * * * \n"
        end
    end

end
