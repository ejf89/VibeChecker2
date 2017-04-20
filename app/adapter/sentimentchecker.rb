class SentimentChecker < Sentimental

    def set_default
        load_defaults
        threshold = 0.1
    end

    def self.declaration(average)
        if average < (-1 * 0.7)
            "very bad"
        elsif average < (-1 * 0.1)
            "bad"
        elsif average > 0.7
            "very good"
        elsif average > 0.05
            "good"
        else
            "smoothly indifferent"
        end
    end

end
