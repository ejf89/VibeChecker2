class Tweet < ActiveRecord::Base
    belongs_to :search

    def self.collect_scores(checker)
         self.where(query_id: Search.last.id).map do |tweet|

            tweet_score = checker.score tweet.content
            tweet.update(score: tweet_score)
            tweet_score
        end
    end

    def self.return_tweets(target, second_target)
        self.where(query_id: Search.last.id).limit(5).each do |tweet|
                if tweet.content.include? (target)
                    words_array = tweet.content.split(" ")
                    words_array.map do |x|
                        if x.include? (target)
                            words_array[words_array.index(x)] = Paint[x, :bright, :red]
                        end

                        if x.include? (second_target)
                            words_array[words_array.index(x)] = Paint[x, :bright, :yellow]
                        end
                        tweet.content = words_array.join(" ")
                    end
                end
                puts "#{tweet.content}\n\n"
                puts "* - * - * - * - * - * - * - * - * - * - * - * - * - * - * - * - *\n\n"
            end

        end



    end

end
