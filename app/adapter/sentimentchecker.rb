class SentimentChecker < Sentimental

    def set_default
        load_defaults
        threshold = 0.1
    end

    def self.declaration(average)
        if average < (-1 * 0.7)
            "very bad"
        elsif average < (-1 * 0.3) && average > (-1 * 0.5)
            "pretty bad"
        elsif average < (-1 * 0.1)
            "bad"
        elsif average > 0.8
            "very good"
        elsif average > 0.03 && average < 0.8
            "pretty good"
        elsif average > 0.1
            "good"
        else
            "smoothly indifferent"
        end
    end

end
