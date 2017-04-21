class Search < ActiveRecord::Base
    has_many :tweets

    def self.search_compare
      current = Paint[Search.last.search, :green]
      matches = Search.where(search: current).reverse
      if matches.length >= 2

        puts "This vibe has been checked before. Would u like to see previous checks of: #{current}?"
        puts "             *****(y/n)*****"




        if gets.chomp == 'y'
            rows1 = ['VIBE']
            rows2 = ['SCORE']
            rows3 = ['# of Vibes']
            rows4 = ['MOMENT']
            stamps = []

            matches.take(5).each do |match|
              rows1 << [match.vibe]
              rows2 << [match.score.round(2)]
              rows3 << [match.count]
              rows4 << [match.created_at.to_s.slice(0...match.created_at.to_s.length - 3)]
              stamps << match.created_at.to_s
            end

            headings_array = []

            if matches.length == 2
                headings_array = ['info', 'NOW', 'THEN']
            elsif matches.length == 3
                headings_array = ['info', 'NOW', 'THEN', 'LONG AGO']
            elsif matches.length == 4
                headings_array = ['info', 'NOW', 'THEN', 'LONG AGO', 'EVEN LONGER']
            elsif matches.length >= 5
                headings_array = ['info', 'NOW', 'THEN', 'LONG AGO', 'EVEN LONGER', 'THE VIBE B.C.']
            end

            table = Terminal::Table.new :title => "#{current}", :headings => headings_array do |t|
              t << rows1.flatten
              t.add_row rows2.flatten
              t.add_row rows3.flatten
              t.add_row rows4.flatten
          end

            puts table
        end
    end

    end

end
