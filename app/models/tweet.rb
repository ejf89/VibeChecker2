class Tweet < ActiveRecord::Base
    belongs_to :search

    def self.collect_scores(checker)
         self.where(query_id: Search.last.id).map do |tweet|

            tweet_score = checker.score tweet.content
            tweet.update(score: tweet_score)
            tweet_score
        end
    end

    def self.return_tweets
        self.where(query_id: Search.last.id).limit(5).each do |tweet|
            # if tweet.content.include? ('@')
            #
            #     # tweet.content = tweet.content.split(" ")
            #     # tweet.content = tweet.content.split(" ")
            #     tweet.content.map do |word|
            #         if word[0] == '@'
            #         word = Paint[word, :yellow]
            #         end
                # tweet.content.join(" ")
            #     end
            # end
            puts "#{tweet.content}\n\n"
            puts "* - * - * - * - * - * - * - * - * - * - * - * - * - * - * - * - *\n\n"
        end
    end

end
