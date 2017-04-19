class SentimentChecker < Sentimental

    def set_default
        load_defaults
        threshold = 0.1
    end

end
