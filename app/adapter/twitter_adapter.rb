class TwitterAdapter

  def twitter_login
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "W3zilQu633o77oezuSwi5D6m8"
    config.consumer_secret     = "J2gvkPupioUbhIXqFXLsAzrROdlLdozFZwukkLgGvOxPnCAs4i"
    config.access_token        = "854334169522024448-qNV9YdJzI0B3YshEMCjdb7mB8CMXDEA"
    config.access_token_secret = "rT0kBstReKuP5Zefz3fiTLeHYXtajJSOzvzxVcw9NjGEo"
  end
end

  def initialize
    puts "please enter a search"
    @answer = "#{gets.chomp}"

    puts "How many vibes should I check?"
    @count = (gets.chomp).to_i
  end

  def call_twitter
      results = twitter_login.search("#{@answer} -RT", {language: "en", include_rts: false}).take(@count)
        tweet_result = results.each do |x|
          user_name = x.attrs[:user][:screen_name]
          content = x.attrs[:text]
          location = x.attrs[:user][:location]
          date = x.attrs[:created_at]
          store_tweet(user_name, content, location, date)
          end
      puts tweet_result

    end

  def add_answer_to_table
    Result.create(:search => "#{@answer}")
  end

  def store_tweet(user_name, content, location, date)
    Tweet.create(
    :user_name => "#{user_name}",
    :content => "#{content}",
    :location => "#{location}",
    :date => "#{date}"
    )
  end




end
