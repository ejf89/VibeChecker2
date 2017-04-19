class Query < ActiveRecord::Base
    has_many :tweets
   # 
   #  def self.return_tweets
   #     Tweet.where(query_id: Query.last.id).limit(5)
   # end
end
