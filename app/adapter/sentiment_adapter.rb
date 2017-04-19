class SentimentChecker

    def initialize
        analyzer = Sentimental.new
        analyzer.load_defaults
    end

    def determine_emotion(sentance)
        binding.pry
        analyzer.sentiment
    end

end
