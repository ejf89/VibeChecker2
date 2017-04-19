class Tweet < ActiveRecord::Base
    belongs_to :search

    def self.collect_scores(checker)
        # binding.pry
         self.where(query_id: Search.last.id).map do |tweet|

            checker.score tweet.content
        end
    end


end
