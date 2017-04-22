class Tweet < ActiveRecord::Base
    belongs_to :search

    def self.collect_scores(checker)
         self.where(query_id: Search.last.id).map do |tweet|

            tweet_score = checker.score tweet.content
            tweet.update(score: tweet_score)
            tweet_score
        end
    end

    def target_color(array, target, color)
        array.map do |x|
            if x.include? (target)
                array[array.index(x)] = Paint[x, :bright, color.to_sym]
            end
        end
    end


    def self.return_tweets(target, second_target)
        self.where(query_id: Search.last.id).limit(5).each do |tweet|
                if tweet.content.include? (target)
                    words_array = tweet.content.split(" ")
                    tweet.target_color(words_array, target, "red")
                    tweet.content = words_array.join(" ")
                end

                if tweet.content.include? (second_target)
                    words_array = tweet.content.split(" ")
                    tweet.target_color(words_array, second_target, "yellow")
                    tweet.content = words_array.join(" ")
                end

                puts "#{tweet.content}\n\n"
                puts "* - * - * - * - * - * - * - * - * - * - * - * - * - * - * - * - *\n\n"
            end
    end
end
