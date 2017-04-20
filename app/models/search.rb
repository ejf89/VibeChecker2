class Search < ActiveRecord::Base
    has_many :tweets

    def self.search_compare
      current = Search.last.search
      matches = Search.where(search: current)
      if matches.length >= 2

        puts "This vibe has been checked before. Would u like to see previous checks of: #{current}?"

        puts "             *****(y/n)*****"




        if gets.chomp == 'y'
            rows1 = ['VIBE']
            rows2 = ['SCORE']
            rows3 = ['# of Vibes']
            stamps = []

            matches.each do |match|
              rows1 << [match.vibe]
              rows2 << [match.score]
              rows3 << [match.count]
              stamps << match.created_at.to_s
            end

            table = Terminal::Table.new :headings => ['HELLO', 'NOW', 'THEN'] do |t|
              t << rows1.flatten
              t.add_row rows2.flatten
              t.add_row rows3.flatten
          end
            puts table
        end
    end

    end

end
