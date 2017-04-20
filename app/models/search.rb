class Search < ActiveRecord::Base
    has_many :tweets

    def self.search_compare
      current = Search.last.search
      matches = Search.where(search: current)
      if matches.length > 2
        # binding.pry
        # puts "\nWould you like to compare the last time the #{lastSearchstring} was checked?\n"
          rows = []
          headings = []
          headings << ["**", "Now"]
          rows << ['Vibe', matches.first.vibe]
          rows << ['Score', "#{matches.first.score}"]
          table = Terminal::Table.new :headings => headings, :rows => rows

          puts table
          binding.pry
      end
      # binding.pry
    end
end