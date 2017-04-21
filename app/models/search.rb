class Search < ActiveRecord::Base
    has_many :tweets

    def self.search_compare
      current = Search.last.search
      matches = Search.where(search: current).reverse
    #   binding.pry
      if matches.length >= 2

        puts "This vibe has been checked before. Would u like to see previous checks of: #{current}?"
        puts "             *****(y/n)*****"




        if gets.chomp == 'y'
            rows1 = ['VIBE']
            rows2 = ['SCORE']
            rows3 = ['# of Vibes']
            stamps = []

            matches.take(5).each do |match|
              rows1 << [match.vibe]
              rows2 << [match.score.round(2)]
              rows3 << [match.count]
              stamps << match.created_at.to_s
            end

            header_array = []
            if matches.length == 2
                header_array = ['tings', 'NOW', 'THEN']
            elsif matches.length == 3
                header_array = ['tings', 'NOW', 'THEN', 'EVEN SOONER']
            elsif matches.length == 4
                header_array = ['tings', 'NOW', 'THEN', 'EVEN SOONER', 'LONGER BEFORE']
            elsif matches.length >= 5
                header_array = ['tings', 'NOW', 'THEN', 'EVEN SOONER' ,'LONGER BEFORE', 'THE VIBE B.C.']
            end


            table = Terminal::Table.new :headings => header_array do |t|

              t << rows1.flatten
              t.add_row rows2.flatten
              t.add_row rows3.flatten
          end
            puts table
        end
    end

    end

end
