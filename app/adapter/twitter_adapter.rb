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
    puts "Please enter the vibe you'd like to check: "
    puts "\n"
    @search = "#{gets.chomp}"

    slice_check
end

def slice_check
    puts "\nHow many people's vibes should I check?"
    @count = "#{gets.chomp}"
    system('clear')

    if @count.to_i < 3 #<-----change back to large num
        puts "Slice too small, try checking more vibes\n"
        slice_check
    else

        @count
    end
end


  def call_twitter
      results = twitter_login.search("#{@search} -RT -@", {language: "en", include_rts: false}).take(@count.to_i)
       add_query_to_table
        results.each do |x|
          user_name = x.attrs[:user][:screen_name]
          content = x.attrs[:text]
          location = x.attrs[:user][:location]
          date = x.attrs[:created_at]
          store_to_all(user_name, content, location, date)
          end
    end

    #all below methods called above
####################################################
  def add_query_to_table
    @query = Search.create(:search => "#{@search}")
  end

  def store_tweet(user_name, content, location, date)
    Tweet.create(
    :user_name => "#{user_name}",
    :content => "#{content}",
    :location => "#{location}",
    :date => "#{date}",
    :query_id => @query.id
    )
  end

  def store_to_all(user_name, content, location, date)
      store_tweet(user_name, content, location, date)
  end
end
########################################################
